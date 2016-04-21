//
//  WeatherViewController.swift
//  Nightstand
//
//  Created by Tommy Crews on 2/23/16.
//  Copyright © 2016 SWOSU Software Engineering. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController,CLLocationManagerDelegate {
    
    private let apiKey = "55b39813acd76f0803a0c2847fdefd4f"

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet weak var RainChanceLabel: UILabel!
    @IBOutlet weak var HumidityLabel: UILabel!
    
    var locationManager: CLLocationManager!
    
    /////////////
    /////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        let forecastService = ForecastService(APIKey: apiKey)
        forecastService.getForecast((locationManager.location?.coordinate.latitude)!, lon: (locationManager.location?.coordinate.longitude)!) {
            (let currently) in
            if let currentWeather = currently{
                dispatch_async(dispatch_get_main_queue()) {
                    if let temperature = currentWeather.temperature {
                        self.tempLabel?.text = "\(temperature)°"
                    }
                    if let precipChance = currentWeather.precipChance {
                        self.RainChanceLabel?.text = "\(precipChance)%"
                    }
                    if let humidity = currentWeather.humidity {
                        self.HumidityLabel?.text = "\(humidity)%"
                    }
                }
                }
           }
      }
        
    @IBAction func BackButtonTouched(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}

// SDG

