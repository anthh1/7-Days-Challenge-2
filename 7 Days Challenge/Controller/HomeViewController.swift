//
//  HomeViewController.swift
//  7 Days Challenge
//
//  Created by Calvin Leonardo on 04/04/20.
//  Copyright © 2020 Mini Challenge 1 - G19. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UITableViewController {

    var challenges = [
        Challenge(challengeID: 1,challengeName: "Push Up", challengeDay: 1, challengeScore: 100, challengeMinReps: 8, challengeObjects: "Kursi", challengeDesc: "", challengeDate: ""),
        Challenge(challengeID: 2, challengeName: "Burpees", challengeDay: 2, challengeScore: 200, challengeMinReps: 10, challengeObjects: "Kursi", challengeDesc: "", challengeDate: ""),
        Challenge(challengeID: 3, challengeName: "3 Steps 180", challengeDay: 3, challengeScore: 300, challengeMinReps: 12, challengeObjects: "Kursi", challengeDesc: "", challengeDate: ""),
        Challenge(challengeID: 4, challengeName: "Plank", challengeDay: 4, challengeScore: 400, challengeMinReps: 14, challengeObjects: "Kursi", challengeDesc: "",challengeDate: ""),
        Challenge(challengeID: 5, challengeName: "Bench Dip", challengeDay: 5, challengeScore: 500, challengeMinReps: 16, challengeObjects: "Kursi", challengeDesc: "",challengeDate: ""),
        Challenge(challengeID: 6, challengeName: "Walk Up Stairs", challengeDay: 6, challengeScore: 600, challengeMinReps: 12, challengeObjects: "Kursi", challengeDesc: "",challengeDate: ""),
        Challenge(challengeID: 7, challengeName: "Wall Handstand", challengeDay: 7, challengeScore: 700, challengeMinReps: 10, challengeObjects: "Kursi", challengeDesc: "",challengeDate: "")
    ]
    
    var dayCount = UserDefaults.standard.integer(forKey: "dayCount")
    var challengeDates = [String]()
    var challengeDay = UserDefaults.standard.integer(forKey: "firstDay")
    
    var cellSpacingHeight: CGFloat = 50
    var selectedIndex = Int()
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationItem.setHidesBackButton(true, animated: true);
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        let today: Int
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("dd")
        today = Int(dateFormatter.string(from: Date()))!
        
        if challengeDay == 0 {
            dayCount+=1
            UserDefaults.standard.set(today, forKey: "firstDay")
            UserDefaults.standard.set(dayCount, forKey: "dayCount")
            print(UserDefaults.standard.integer(forKey: "firstDay"))
            print(UserDefaults.standard.integer(forKey: "dayCount"))
        } else if challengeDay != today {
            dayCount+=1
            UserDefaults.standard.set(today, forKey: "firstDay")
            UserDefaults.standard.set(dayCount, forKey: "dayCount")
            print(UserDefaults.standard.integer(forKey: "firstDay"))
            print(UserDefaults.standard.integer(forKey: "dayCount"))
        } else if dayCount == 7{
            UserDefaults.standard.set(0, forKey: "firstDay")
            UserDefaults.standard.set(0, forKey: "dayCount")
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return challenges.count
        }
        else{
            return challenges.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "challengeCell", for: indexPath) as! ChallengeTableViewCell
        
        if(indexPath.section == 0){
            let challenge = challenges[indexPath.row]
            cell.challengeNameLbl.text = challenge.challengeName
            cell.challengeScoreLbl.text = "\(challenge.challengeScore) pts"
            cell.challengeDayLbl.text = "Day \(challenge.challengeDay)"
            
        }else if (indexPath.section == 1){
            let challenge = challenges[indexPath.row]
    
            cell.challengeNameLbl.text = challenge.challengeName
            cell.challengeScoreLbl.text = "\(challenge.challengeScore) pts"
            cell.challengeDayLbl.text = "Day \(challenge.challengeDay)"
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath) -> CGFloat {
    
        if (indexPath.section == 0){
            let challenge = challenges[indexPath.row]
            if(challenge.challengeID != dayCount){
                return 0
            }
            
        }else if (indexPath.section == 1) {
            let challenge = challenges[indexPath.row]
            if(challenge.challengeID <= dayCount){
                return 0
            }
        }
        return tableView.rowHeight
    }
    
     
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
        let challenge = challenges[indexPath.row]
        performSegue(withIdentifier: "challengeInfoVC", sender: challenge)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "Today's Challenge"
        } else {
            return "Next Challenges"
        }
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        tableView.tableHeaderView?.backgroundColor = UIColor.blue
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "challengeInfoVC" {
            let vc : ChallengeInfoViewController = segue.destination as! ChallengeInfoViewController
            let challenge = challenges[selectedIndex]
            
            vc.challengeDay = challenge.challengeDay
            vc.challengeName = challenge.challengeName
            vc.challengeDesc = challenge.challengeDesc
            vc.challengeScore = challenge.challengeScore
            print(selectedIndex)
        }
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//    }
    

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension Date {
       func dayNumberOfWeek() -> Int? {
           return Calendar.current.dateComponents([.weekday], from: self).weekday
       }
}

