//
//  SettingsTableView.swift
//  Nightstand
//
//  Created by Tommy Crews on 2/18/16.
//  Copyright © 2016 SWOSU Software Engineering. All rights reserved.
//

import UIKit

public class SettingsTableView: UITableViewController {

    // Define controls
    @IBOutlet weak var BrightnessSlider: UISlider!
    @IBOutlet weak var ThemeChanger: UISegmentedControl!
    @IBOutlet weak var CloseButton: UIBarButtonItem!
    
    let defaultSettings = NSUserDefaults.standardUserDefaults()
    
    // Define access to previous view controller
    var CurrentVC: ViewController!
    
    
    @IBAction func closeSettings(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func ThemeChanged(sender: UISegmentedControl!) {
        if ThemeChanger.selectedSegmentIndex == 0 {
            defaultSettings.setBool(false, forKey: "LightTheme")
        } else {
            defaultSettings.setBool(true, forKey: "LightTheme")
        }
        
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        if defaultSettings.boolForKey("LightTheme") {
            ThemeChanger.selectedSegmentIndex = 1
        }
        BrightnessSlider.value = defaultSettings.floatForKey("Brightness")
    }
    
    

}
