//
//  AlarmSetupController.swift
//  Nightstand
//
//  Created by Tommy Crews on 3/9/16.
//  Copyright © 2016 SWOSU Software Engineering. All rights reserved.
//

import UIKit

class AlarmSetupController: UITableViewController {

    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

                
    }
    
    let defaultSettings = NSUserDefaults.standardUserDefaults()
    
    
    @IBAction func ChangeTime(sender: AnyObject) {
        defaultSettings.integerForKey(<#T##defaultName: String##String#>)
    }


}

//SDG

