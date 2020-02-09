//
//  ViewController.swift
//  WeatherView
//
//  Created by Carlos Solana on 04.02.20.
//  Copyright © 2020 Cybermoth. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var weatherConditionImage: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var degreesLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!

    let weatherManager = WeatherManager()
    //Remember to change bg images to vectors
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // let know delegate that this is the VC
        searchTextField.delegate = self
        
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        print(searchTextField.text!)
        self.searchTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(searchTextField.text!)
        self.searchTextField.endEditing(true)
        return true
        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Write something dude!"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        
        searchTextField.text = ""
    }
}

