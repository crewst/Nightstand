//
//  AlarmOptionsTables.swift
//  Nightstand
//
//  Created by Tommy Crews on 3/24/16.
//  Copyright © 2016 SWOSU Software Engineering. All rights reserved.
//

import UIKit

class AlarmOptionsTables: UITableViewController {

    @IBOutlet weak var MondayCell: UITableViewCell!
    @IBOutlet weak var TuesdayCell: UITableViewCell!
    @IBOutlet weak var WednesdayCell: UITableViewCell!
    @IBOutlet weak var ThursdayCell: UITableViewCell!
    @IBOutlet weak var FridayCell: UITableViewCell!
    @IBOutlet weak var SaturdayCell: UITableViewCell!
    @IBOutlet weak var SundayCell: UITableViewCell!
    
    @IBOutlet weak var Sound0: UITableViewCell!
    @IBOutlet weak var Sound1: UITableViewCell!
    @IBOutlet weak var Sound2: UITableViewCell!
    
    var checked = [Bool](count: 7, repeatedValue: false)
    
    func tableViewController(tableView: UITableViewController, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell!
        
        //configure you cell here.
        if !checked[indexPath.row] {
            cell.accessoryType = .None
        } else if checked[indexPath.row] {
            cell.accessoryType = .Checkmark
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            if cell.accessoryType == .Checkmark {
                cell.accessoryType = .None
                checked[indexPath.row] = false
            } else {
                cell.accessoryType = .Checkmark
                checked[indexPath.row] = true
            }
        }    
    }
}

// SDG

