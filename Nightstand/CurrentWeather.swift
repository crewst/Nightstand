//
//  CurrentWeather.swift
//  Nightstand
//
//  Created by Tommy Crews on 3/2/16.
//  Copyright © 2016 SWOSU Software Engineering. All rights reserved.
//

import Foundation

struct CurrentWeather {
    let temperature: Int
    let humidity: Int
    let precipChance: Int
    let summary: String
    
    init(WeatherDictionary: [String: AnyObject]) {
        temperature = WeatherDictionary["temperature"] as! Int
        humidity = WeatherDictionary["humidity"] as! Int
        precipChance = WeatherDictionary["precipChance"] as! Int
        summary = WeatherDictionary["summary"] as! String
        
    }
}

// SDG