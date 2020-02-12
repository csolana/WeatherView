//
//  WweatherManager.swift
//  WeatherView
//
//  Created by Carlos Solana on 08.02.20.
//  Copyright © 2020 Cybermoth. All rights reserved.
//

import UIKit

protocol WeatherManagerDelegate {
    func didUpdateWeather(weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    //make a constant e.g. "weatherURL" to hold the api string
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=3e5dafce21e4b0aaf128673f7df50e94&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    //make a function e.g."fetchWeather" to fetch the weather with a parameter e.g."cityName" of type string
    func fetchWeather(cityName: String) {
        //inside make a constant e.g."urlString" to trail the "cityName" to the it using string interpolation
        let urlStringCity = "\(weatherURL)&q=\(cityName)"
        let urlString = urlStringCity.replacingOccurrences(of: " ", with: "+")
        requestWeather(with: urlString)
    }
    //create a function e.g."requestWeather" to request the weather that takes "urlString" as parameter of type String to hold the networking steps. Use this function in fetchWeather() to request and pass "urlString" as parameter
    func requestWeather(with stringURL: String) {
        //networking:
        //create url using if let statement
        if let url = URL(string: stringURL) {
            //create a session url
            let session = URLSession(configuration: .default)
            //give session a task, later convert it into a closure and delete the hanle method
            let task = session.dataTask(with: url) { (data, response, error) in
                //check for errors
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                //create a constant to check if data is safe
                if let safeData =  data {
                    //convert data to string, look for a string method that takes data
//                    let dataString = String(data: safeData, encoding: .utf8)
//                    print(dataString!)
                    if let weather = self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(weatherManager: self, weather: weather)
                    }
                }
            }
            //resume task
            task.resume()
        }
    }
    
    //create a parseJSON object with input e.g."weatherData"
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        //inform xcode how data is structured, so we use a structure, create a decoder for JSON and initialise it using JSONDecoder()
        let decoder = JSONDecoder()
        // use the decoder, use the WeatherData.self as data type and weatherData input as Data, mark it with "try" and put it inside a "do" block, then use a "catch" block to cartch the error. Then use "let" to create a WeatherData object: "decodedData",
        do {
        let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            //tap into name inside a print statement
            let id = decodedData.weather[0].id
            let name = decodedData.name
            let temp = decodedData.main.temp
            
            
            let weather = WeatherModel(conditionID: id, cityName: name, temperature: temp)
            return weather
//            print(weather.getConditionName(weatherID: id))
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
        
    }
    

    
    
}
