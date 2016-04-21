//
//  CurrentWeather.swift
//  Nightstand
//
//  Created by Tommy Crews on 3/2/16.
//  Copyright © 2016 SWOSU Software Engineering. All rights reserved.
//

import Foundation

struct CurrentWeather {
    
    let temperature: Int?
    let humidity: Int?
    let precipChance: Int?
    let summary: String?
    
    init(weatherDictionary: [String: AnyObject]) {
        temperature = weatherDictionary["temperature"] as? Int
        
        if let humidityFloat = weatherDictionary["humidity"] as? Double {
            humidity = Int(humidityFloat * 100)
        } else {
            humidity = nil
        }
        
        if let precipFloat = weatherDictionary["precipProbability"] as? Double {
            precipChance = Int(precipFloat * 100)
        } else {
            precipChance = nil
        }
        
        summary = weatherDictionary["summary"] as? String
    }
}

// SDG

