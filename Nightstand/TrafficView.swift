//
//  TrafficView.swift
//  Nightstand
//
//  Created by Mac Lab on 2/25/16.
//  Copyright © 2016 SWOSU Software Engineering. All rights reserved.
//


import UIKit
import MapKit
import CoreLocation




class TrafficView:UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{
    
    weak var mapView: MKMapView!
    
    let  locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.delegate = self
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        self.locationManager.requestWhenInUseAuthorization()
        
        self.locationManager.startUpdatingLocation()
        
        self.mapView.showsUserLocation = true
        
        self.mapView.showsTraffic = true
        
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        }
    
func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

    let location = locations.last
    
    let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
    
    let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.1,  longitudeDelta: 0.1))
    
    self.mapView.setRegion(region, animated: true)
    
    self.locationManager.stopUpdatingLocation()

    }

    func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
    {
        print("Errors: " + error.localizedDescription)
    };
}