//
//  WeatherData.swift
//  WeatherView
//
//  Created by Carlos Solana on 10.02.20.
//  Copyright © 2020 Cybermoth. All rights reserved.
//

import UIKit
// make a structure called as the file, and conforme it to swift's Decodable protocol
struct WeatherData: Codable {
    //create constant of api parameters wanted e.g."name" of type String
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {

    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Double
    let humidity: Double
}

struct Weather: Codable {
    
    let description: String
    let id: Int
    let main: String
    let icon: String
}
