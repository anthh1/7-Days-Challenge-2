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
        Challenge(challengeID: 1,challengeName: "Push Up", challengeDay: 1, challengeScore: 100, challengeMinReps: 8, challengeObjects: "Kursi", challengeDesc: ""),
        Challenge(challengeID: 2, challengeName: "Sit Up", challengeDay: 2, challengeScore: 200, challengeMinReps: 10, challengeObjects: "Kursi", challengeDesc: ""),
        Challenge(challengeID: 3, challengeName: "Plank", challengeDay: 3, challengeScore: 300, challengeMinReps: 12, challengeObjects: "Kursi", challengeDesc: ""),
        Challenge(challengeID: 4, challengeName: "Jumping", challengeDay: 4, challengeScore: 400, challengeMinReps: 14, challengeObjects: "Kursi", challengeDesc: ""),
        Challenge(challengeID: 5, challengeName: "Push Up", challengeDay: 5, challengeScore: 500, challengeMinReps: 16, challengeObjects: "Kursi", challengeDesc: ""),
        Challenge(challengeID: 6, challengeName: "Push Up", challengeDay: 6, challengeScore: 600, challengeMinReps: 12, challengeObjects: "Kursi", challengeDesc: ""),
        Challenge(challengeID: 7, challengeName: "Push Up", challengeDay: 7, challengeScore: 700, challengeMinReps: 10, challengeObjects: "Kursi", challengeDesc: "")
    ]
    
    var challengeDates = [String]()
    
    let cellSpacingHeight: CGFloat = 50


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        let today: String
        
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("d")
        today = dateFormatter.string(from: Date())
        
        let searchValue = today
        var currentIndex = 0

        for challengeDate in challengeDates
        {
            if challengeDate != searchValue {
                fetchChallenge()
                startChallenges()

                break
            }
            currentIndex += 1
        }
        
//        deleteAllData("StartChallenge")
//
//        startChallenges()
    }
    
    func startChallenges() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "StartChallenge", in: context)
        let startChallenge = NSManagedObject(entity: entity!, insertInto: context)
        
        let currentDate: String

        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("d")
        currentDate = dateFormatter.string(from: Date())
        
        startChallenge.setValue(currentDate, forKey: "challengeDate")
        
        do {
           try context.save()
          } catch {
           print("Failed saving")
        }
    }
        
    func deleteAllData(_ entity:String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(fetchRequest)
            for object in results {
                guard let objectData = object as? NSManagedObject else {continue}
                context.delete(objectData)
            }
        } catch let error {
            print("Detele all data in \(entity) error :", error)
        }
    }
    
    func fetchChallenge() {
    
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "StartChallenge")
        request.returnsObjectsAsFaults = false

        do {
            let result = try context.fetch(request)
            
           for data in result as! [NSManagedObject] {
                challengeDates.append("\(data.value(forKey: "challengeDate"))")
                print(challengeDates.count)
                print(challengeDates)
            }
            
        } catch {
            print("Failed")
        }
    }
    
    
    func convertToJSONArray(moArray: [NSManagedObject]) -> Any {
        var jsonArray: [[String: Any]] = []
        for item in moArray {
            var dict: [String: Any] = [:]
            for attribute in item.entity.attributesByName {
                //check if value is present, then add key to dictionary so as to avoid the nil value crash
                if let value = item.value(forKey: attribute.key) {
                    dict[attribute.key] = value
                }
            }
            jsonArray.append(dict)
        }
        return jsonArray
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return 1
        }
        else{
            return challenges.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "challengeCell", for: indexPath) as! ChallengeTableViewCell
        let challenge = challenges[indexPath.row]
        
        cell.challengeNameLbl.text = challenge.challengeName
        cell.challengeScoreLbl.text = "Score : \(challenge.challengeScore)"
        cell.challengeDayLbl.text = "Day \(challenge.challengeDay)"
        
        return cell
    }
     
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let challengeInfoVC = segue.destination as? ChallengeInfoViewController {

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
