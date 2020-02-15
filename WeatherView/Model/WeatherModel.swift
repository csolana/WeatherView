//
//  WeatherModel.swift
//  WeatherView
//
//  Created by Carlos Solana on 10.02.20.
//  Copyright © 2020 Cybermoth. All rights reserved.
//

import UIKit

struct WeatherModel {
    
    let conditionID: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    
    
    var getConditionName: String {
        
        switch conditionID {
            
        case 200:
            return "cloud.rain"
        case 201...209:
            return "cloud.heavyrain"
        case 210...211:
            return "cloud.bolt"
        case 212...213:
            return "cloud.bolt.rain"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "cun.max"
        case 801:
            return "cloud.sun"
        case 802...804:
            return "smoke"
        default:
            return "cloud"
            
        }
    
    }
    
}
