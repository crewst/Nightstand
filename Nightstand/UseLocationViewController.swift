//
//  UseLocationViewController.swift
//  Nightstand
//
//  Created by Tommy Crews on 3/8/16.
//  Copyright © 2016 SWOSU Software Engineering. All rights reserved.
//

import UIKit
import QuartzCore
import CoreLocation

class UseLocationViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var imageAnimation: UIImageView!
    @IBOutlet weak var locationSwitch: UISwitch!
    @IBOutlet weak var locationSpinner: UIActivityIndicatorView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var openSettingsButton: UIButton!
    
    var locationManager: CLLocationManager!
    
    var needLocationString = "In order for Nightstand to work properly, it needs access to your location. This information is only used to retrieve weather and traffic data and never leaves the app. To enable location services, use the button below."
    
    override func viewDidLoad() {
        
        if CLLocationManager.authorizationStatus() == (CLAuthorizationStatus.AuthorizedWhenInUse) || CLLocationManager.authorizationStatus() == (CLAuthorizationStatus.AuthorizedAlways) {
            
            locationAllowed()
            
        }
        
        if CLLocationManager.authorizationStatus() == (CLAuthorizationStatus.Denied) {
            locationDenied()
        }
        
        imageAnimation.animationImages = [
        
            UIImage(named: "img0.png")!,
            UIImage(named: "img1.png")!,
            UIImage(named: "img2.png")!,
            UIImage(named: "img3.png")!,
            UIImage(named: "img4.png")!,
            UIImage(named: "img5.png")!,
            UIImage(named: "img6.png")!,
            UIImage(named: "img7.png")!,
            UIImage(named: "img8.png")!,
            UIImage(named: "img9.png")!,
            UIImage(named: "img10.png")!,
            UIImage(named: "img11.png")!,
            UIImage(named: "img12.png")!,
            UIImage(named: "img13.png")!,
            UIImage(named: "img14.png")!,
            UIImage(named: "img15.png")!,
            UIImage(named: "img16.png")!,
            UIImage(named: "img17.png")!,
            UIImage(named: "img18.png")!,
            UIImage(named: "img19.png")!,
            UIImage(named: "img20.png")!,
            UIImage(named: "img21.png")!,
            UIImage(named: "img22.png")!,
            UIImage(named: "img23.png")!,
            UIImage(named: "img24.png")!,
            UIImage(named: "img25.png")!,
            UIImage(named: "img26.png")!,
            UIImage(named: "img27.png")!,
            UIImage(named: "img28.png")!,
            UIImage(named: "img29.png")!,
            
        ]
        
        imageAnimation.animationDuration = 1.5
        imageAnimation.animationRepeatCount = 2
        imageAnimation.startAnimating()
        
    }
    
    @IBAction func switchFlipped(sender: AnyObject) {
        
        let seconds = 0.2
        let delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
        let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        
        dispatch_after(dispatchTime, dispatch_get_main_queue(), {
            
            self.getLocation()
            
        })
    }
    
    func getLocation() {
        
        
        locationSwitch.hidden = true
        locationSpinner.alpha = 1
        locationSpinner.startAnimating()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        

    }
    
    @IBAction func openSettings(sender: AnyObject) {
        
        UIApplication.sharedApplication().openURL(NSURL(string: UIApplicationOpenSettingsURLString)!)
    
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        switch status {
        case .AuthorizedWhenInUse:
            locationAllowed()
            break
        case .Denied:
            locationDenied()
            break
        default:
            break
        }
    }
    func locationDenied() {
        locationSwitch.hidden = true
        locationSwitch.enabled = false
        locationSpinner.hidden = true
        openSettingsButton.hidden = false
        openSettingsButton.enabled = true
        infoLabel.text = needLocationString
        bottomLabel.hidden = true
    }
    func locationAllowed() {
        let AlarmSetupControllerObject = self.storyboard?.instantiateViewControllerWithIdentifier("AlarmSetupController") as? AlarmSetupController
        self.navigationController?.pushViewController(AlarmSetupControllerObject!, animated: true)
    }

}

// SDG


