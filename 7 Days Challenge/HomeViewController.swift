//
//  HomeViewController.swift
//  7 Days Challenge
//
//  Created by Anthony Angkasa on 04/04/20.
//  Copyright © 2020 Mini Challenge 1 - G19. All rights reserved.
//

import UIKit

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return challenges.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "challengeCell", for: indexPath) as! ChallengeTableViewCell
        let challenge = challenges[indexPath.row]
        
        cell.challengeNameLbl.text = challenge.challengeName
        cell.challengeScoreLbl.text = "Score : \(challenge.challengeScore)"
        cell.challengeDayLbl.text = "Day \(challenge.challengeDay)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let challenge = challenges[indexPath.row]
        performSegue(withIdentifier: "challengeInfoVC", sender: challenge)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
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
