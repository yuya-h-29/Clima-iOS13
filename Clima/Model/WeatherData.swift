//
//  WeatherData.swift
//  Clima
//
//  Created by Yuya Harada on 2020/07/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//
//weather[0].description

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable{
    let temp: Double
}

struct Weather: Codable {
    let description: String
    let id: Int
}
