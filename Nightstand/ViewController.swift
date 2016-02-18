//
//  ViewController.swift
//  Nightstand
//
//  Created by Tommy Crews on 2/9/16.
//  Copyright © 2016 SWOSU Software Engineering. All rights reserved.
//

import UIKit


public class ViewController: UIViewController {
	
	
    @IBOutlet public var ClockLabel: UILabel!
	@IBOutlet weak var SettingsButton: UIButton!
	
	var timer = NSTimer()
	var dateFormatter = NSDateFormatter()
	
	var sec = SettingsTableView()
	
	let defaultSettings = NSUserDefaults.standardUserDefaults()
	let firstLaunch = NSUserDefaults.standardUserDefaults().boolForKey("IsFirstLaunch")

	
	
	override public func viewDidLoad() {
		
		if firstLaunch {
			defaultSettings.setBool(false, forKey: "LightTheme")
			defaultSettings.setFloat(0.0, forKey: "Brightness")
		}
		
		
		defaultSettings.setBool(false, forKey: "lightMode")
		
		super.viewDidLoad()
		
		
				dateFormatter.timeStyle = .ShortStyle
		
		let timeString = "\(dateFormatter.stringFromDate(NSDate()))"
		
		ClockLabel.text = timeString
		
		// Do any additional setup after loading the view, typically from a nib.
		
		self.timer = NSTimer.scheduledTimerWithTimeInterval(1.0,
			target: self,
			selector: Selector("tick"),
			userInfo: nil,
			repeats: true)
		UIScreen.mainScreen().brightness = CGFloat(0.0)
	}
	
	@objc func tick() {
		
		if defaultSettings.boolForKey("LightTheme") {
			ClockLabel.textColor = UIColor.blackColor()
			SettingsButton.tintColor = UIColor.blackColor()
			self.view.backgroundColor = UIColor.whiteColor()
		}
		if defaultSettings.boolForKey("LightTheme") == false {
			ClockLabel.textColor = UIColor.whiteColor()
			SettingsButton.tintColor = UIColor.whiteColor()
			self.view.backgroundColor = UIColor.blackColor()
		}
		ClockLabel.textColor = UIColor.whiteColor()
				
		ClockLabel.text = NSDateFormatter.localizedStringFromDate(NSDate(),
			dateStyle: .NoStyle,
			timeStyle: .ShortStyle)
	}

}