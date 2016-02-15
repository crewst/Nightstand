//
//  ViewController.swift
//  Nightstand
//
//  Created by Tommy Crews on 2/9/16.
//  Copyright © 2016 SWOSU Software Engineering. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
	
	
    @IBOutlet weak var ClockLabel: UILabel!
	@IBOutlet weak var SettingsButton: UIButton!
	
	
	var timer = NSTimer()
	var dateFormatter = NSDateFormatter()
	

	
	override func viewDidLoad() {
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
		ClockLabel.text = NSDateFormatter.localizedStringFromDate(NSDate(),
			dateStyle: .NoStyle,
			timeStyle: .ShortStyle)
	}

}