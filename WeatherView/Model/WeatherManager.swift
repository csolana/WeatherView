//
//  WweatherManager.swift
//  WeatherView
//
//  Created by Carlos Solana on 08.02.20.
//  Copyright © 2020 Cybermoth. All rights reserved.
//

import UIKit

struct WeatherManager {
    //make a constant e.g. "weatherURL" to hold the api string
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=3e5dafce21e4b0aaf128673f7df50e94&units=metric"
    
    //make a function e.g."fetchWeather" to fetch the weather with a parameter e.g."cityName" of type string
    func fetchWeather(cityName: String) {
        //inside make a constant e.g."urlString" to trail the "cityName" to the it using string interpolation
        let urlString = "\(weatherURL)&q=\(cityName)"
        requestWeather(stringURL: urlString)
    }
    //create a function e.g."requestWeather" to request the weather that takes "urlString" as parameter of type String to hold the networking steps. Use this function in fetchWeather() to request and pass "urlString" as parameter
    func requestWeather(stringURL: String) {
        //networking:
        //create url using if let statement
        if let url = URL(string: stringURL) {
            //create a session url
            let session = URLSession(configuration: .default)
            //give session a task
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            //resume task
            task.resume()
        }
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        //create a func "handle(data: Data?, response: URLResponse?, error: Error?)" check for errors if there is print them then return to end method, use it as completionHandler
        if error != nil {
            print(error!)
            return
        }
        //create a constant to check if data is safe
        if let safeData =  data {
            //convert data to string, look for a string method that takes data
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString!)
        }
    }
    
}
