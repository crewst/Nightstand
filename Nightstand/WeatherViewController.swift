//
//  WeatherViewController.swift
//  Nightstand
//
//  Created by Tommy Crews on 2/23/16.
//  Copyright © 2016 SWOSU Software Engineering. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet weak var RainChanceLabel: UILabel!
    @IBOutlet weak var HumidityLabel: UILabel!
    
    /////////////
    /////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let plistPath = NSBundle.mainBundle().pathForResource("CurrentWeather", ofType: "plist"), let weatherDictionary = NSDictionary(contentsOfFile: plistPath), let currentWeatherDictionary = weatherDictionary["currently"] as? [String: AnyObject] {
            
            let currentWeather = CurrentWeather(WeatherDictionary: currentWeatherDictionary)
            
            tempLabel.text = "\(currentWeather.temperature)°"
            RainChanceLabel.text = "\(currentWeather.precipChance)%"
            HumidityLabel.text = "\(currentWeather.humidity)%"
            
        }
        
        
    }
    
    
    @IBAction func BackButtonTouched(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}

// SDG