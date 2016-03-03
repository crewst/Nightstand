//
//  CurrentWeather.swift
//  Stormy
//
//  Created by Pasan Premaratne on 5/12/15.
//  Copyright (c) 2015 Treehouse. All rights reserved.
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
