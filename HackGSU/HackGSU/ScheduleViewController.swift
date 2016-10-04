//
//  ScheduleViewController.swift
//  hackGSU
//
//  Created by Dylan Welch on 10/1/16.
//  Copyright © 2016 hackGSU. All rights reserved.
//

import Foundation
import UIKit

class ScheduleViewController: UITableViewController {

    let cellId = "cellId"
    
    var time: [String] = [""]
    var eventLocation: [String] = ["Location 1", "Location 2", "Location 3"]
    var dayOfWeekend: [String] = ["Friday", "Saturday", "Sunday"]
    var timesForFriday: [String] = ["5:00pm", "6:00pm", "6:30pm", "7:00pm", "8:00pm", "8:30pm", "9:30pm", "10:30pm", "12:00am"]
    var timesForSaturday: [String] = ["8:00am", "11:00am", "1:00pm", "1:30am", "2:00pm", "3:00pm", "6:00pm", "9:00pm", "12:00am"]
    var timesForSunday: [String] = ["8:00am","9:00am","10:00am","11:30am", "12:15am"]
    var eventDescriptionFriday: [String] = ["Early Check-in Begins / Late Registration", "Check-in", "Dinner", "Opening Ceremonies", "Hacking Begins Idea Mixer / Team Forming", "Development Workshop A", "Development Workshop B", "Development Workshop C", "Friday Midnight Madness"]
    var eventDescriptionSaturday: [String] = ["Breakfast", "Development Workshop D", "Lunch", "TBD", "Devlopment Workshop E", "TBD", "Dinner", "Snack", "Saturday Midnight Madness"]
    var eventDesriptionSunday: [String] = ["Breakfast", "Submit to Devpost Hacking Ends", "Hack Expo", "Finalist Demos", "Closing/Awards Ceremonies"]
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        var allowsSelection: Bool = false
        
        tableView.register(ScheduleTableCell.self, forCellReuseIdentifier: cellId)
        
    }
    /*
    func scheduleForEachDay () -> [String]{
        switch dayOfWeekend[section]{
        case 0:
            return timesForFriday
            break
        case 1:
            return [timesForSaturday]
            break
        case 2:
            return [timesForSunday]
            break
        }
        
        
    }
    */
    
    override func numberOfSections(in tableView: UITableView) -> Int{
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String{
        //given the index, return title string
        return dayOfWeekend[section]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //given the index of section, give the number of rows (cells)
        switch section {
            case 0:
                return 9
                break
            case 1:
                return 9
                break
            case 2:
                return 5
                break
        default:
            return 0
            break
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //given the index of the cell, return the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ScheduleTableCell
        
        
        //cell.eventTitle.text = eventTitle[indexPath.row]

        //cell.eventText.text = eventDescription[indexPath.row]
        
        return cell
    }
    
}

