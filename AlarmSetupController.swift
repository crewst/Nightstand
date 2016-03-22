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
    
    

    @IBAction func closeForm(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}

//SDG

