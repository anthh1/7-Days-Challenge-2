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
        Challenge(challengeID: 1,challengeName: "Bench Push Up", challengeDay: 1, challengeScore: 100, challengeDesc: "this push up will be easier than floor push up because it is an inclined angle, therefore it will not be your full body weight, do this for 15 repetitions or as desired. ", challengeImage: "pushup", challengeVideo: "cpushup", videoThumbnail: "thumb"),
        Challenge(challengeID: 2, challengeName: "Burpees", challengeDay: 2, challengeScore: 200, challengeDesc: "Get into push up position, stand up and jump up! When you land, go back into push up position and do one push up, repeat. Do this for 10 times!", challengeImage: "burpees", challengeVideo: "cburpees", videoThumbnail: "thumb"),
        Challenge(challengeID: 3, challengeName: "3 Steps 180", challengeDay: 3, challengeScore: 300, challengeDesc: "Start with your left leg take one step forward, then with your right foot, land 90 degrees to the direction you are facing and finally land on your left leg with your right leg hanging, this is for practicing your balance.  go back the other way, repeat for 10 times.", challengeImage: "steps180", challengeVideo: "csteps180", videoThumbnail: ""),
        Challenge(challengeID: 4, challengeName: "Reverse Plank", challengeDay: 4, challengeScore: 400, challengeDesc: "do the reverse plank from a sitting position with both legs outstretched in front, put your palms behind your butt and lift up your hip until you form a nice right angled triangle. and hold for 30 seconds or longer. ", challengeImage: "plank", challengeVideo: "cplank", videoThumbnail: ""),
        Challenge(challengeID: 5, challengeName: "Bench Dip", challengeDay: 5, challengeScore: 500, challengeDesc: "Step up with one leg and carry your whole body up, then lift the other leg’s knee to chest high or at least waist high. and repeat this for the other leg as well, go for 10 repetitions .", challengeImage: "benchDip", challengeVideo: "cbenchdipp", videoThumbnail: ""),
        Challenge(challengeID: 6, challengeName: "Walk Up Stairs", challengeDay: 6, challengeScore: 600, challengeDesc: "Walk upstairs, by skipping one or two steps at a time depending on your abilities and repeat 5 times up and down.", challengeImage: "walkStairs", challengeVideo: "cwalkupstairs", videoThumbnail: ""),
        Challenge(challengeID: 7, challengeName: "Wall Handstand", challengeDay: 7, challengeScore: 700, challengeDesc: "Use the wall anywhere to do a handstand, if you are able, maybe you can try hand stand push ups, if you want your walls to be as clean, make sure to clean your feet which might dirty the walls try to hold for 10 seconds.", challengeImage: "wallHandstand", challengeVideo: "chandstand", videoThumbnail: "")
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
            cell.challengeImageBg.image = UIImage(named: "\(challenge.challengeImage)")
        }else if (indexPath.section == 1){
            let challenge = challenges[indexPath.row]
            cell.challengeNameLbl.text = challenge.challengeName
            cell.challengeScoreLbl.text = "\(challenge.challengeScore) pts"
            cell.challengeDayLbl.text = "Day \(challenge.challengeDay)"
            cell.challengeImageBg.image = UIImage(named: "\(challenge.challengeImage)")

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
        
        if (indexPath.section == 0){
            self.selectedIndex = indexPath.row
            let challenge = challenges[indexPath.row]
            
            Timer.scheduledTimer(withTimeInterval: 0.18, repeats: false) { (timer) in
                self.performSegue(withIdentifier: "challengeInfoVC", sender: challenge)
            }
            
        }else if (indexPath.section == 1){
            showAlert()
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 10, y: 20, width: tableView.bounds.size.width, height: 30))
        headerView.backgroundColor = .white
        
        let headerLabel = UILabel(frame: CGRect(x: 30, y: 20, width: tableView.bounds.size.width, height: 30))
        
        if section == 0 {
            headerLabel.text = "Today's Challenge"
        } else {
            headerLabel.text = "Next Challenge"
        }
        
        headerView.addSubview(headerLabel)
        
        return headerView
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "challengeInfoVC" {
            let vc: ChallengeInfoViewController = segue.destination as! ChallengeInfoViewController
            let challenge = challenges[selectedIndex]
            
            vc.videoFile = challenge.challengeVideo
            vc.challengeDay = challenge.challengeDay
            vc.challengeName = challenge.challengeName
            vc.challengeDesc = challenge.challengeDesc
            vc.challengeScore = challenge.challengeScore
            vc.videoThumbnail = challenge.videoThumbnail

            print(selectedIndex)
        }
        
        
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Challenge Locked", message: "You can't access this challenge yet", preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.cancel, handler: { _ in
            //Cancel Action
        }))
       
        self.present(alert, animated: true, completion: nil)
    }

}

extension Date {
       func dayNumberOfWeek() -> Int? {
           return Calendar.current.dateComponents([.weekday], from: self).weekday
       }
}

