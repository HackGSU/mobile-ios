//
//  ScheduleViewController.swift
//  hackGSU
//
//  Created by user on 10/1/16.
//  Copyright © 2016 hackGSU. All rights reserved.
//

import Foundation
import UIKit

class ScheduleViewController: UITableViewController {

    var time: [String] = ["2:00pm", "12:00am", "4:00pm"]
    var eventTitle: [String] = ["New Announcement", "Announcement 2", "Announcement 3"]
    var eventDescription: [String] = ["The event will take place in this location", "event description", "This event is cancelled"]
    var dayOfWeekend: [String] = ["Friday", "Saturday", "Sunday"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var allowsSelection: Bool = false
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int{
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String{
        //given the index, return title stirng
        return dayOfWeekend[section]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //given the index of section, give the number of rows (cells)
        switch section {
            case 0:
                return 1
                break
            case 1:
                return 2
                break
            case 2:
                return 3
                break
        default:
            return 0
            break
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        <#code#>
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //given the index of the cell, return the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScheduleCell", for: indexPath) as! ScheduleCell
        
        cell.time.text = time[indexPath.row]
        cell.eventTitle.text = eventTitle[indexPath.row]
        cell.eventDescription.text = eventDescription[indexPath.row]
        
        return cell
    }
    
}

class ScheduleCell: UITableViewCell{
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventDescription: UILabel!
}
