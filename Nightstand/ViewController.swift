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
	

	
	override public func viewDidLoad() {
		
		
		
		super.viewDidLoad()
		
		let sec = SettingsTableView(); sec.CurrentVC = self
		
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
		ClockLabel.text = NSDateFormatter.localizedStringFromDate(NSDate(),
			dateStyle: .NoStyle,
			timeStyle: .ShortStyle)
	}

}