//
//  HomeViewController.swift
//  7 Days Challenge
//
//  Created by Anthony Angkasa on 04/04/20.
//  Copyright © 2020 Mini Challenge 1 - G19. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    
    var challengeName: String
    

    let challenges = [
       Challenge(challengeName: "Push Up", challengeDay: 1, challengeScore: 100, challengeMinReps: 8, challengeObjects: "Kursi", challengeDesc: ""),
       Challenge(challengeName: "Push Up", challengeDay: 1, challengeScore: 100, challengeMinReps: 8, challengeObjects: "Kursi", challengeDesc: ""),
       Challenge(challengeName: "Push Up", challengeDay: 1, challengeScore: 100, challengeMinReps: 8, challengeObjects: "Kursi", challengeDesc: ""),
       Challenge(challengeName: "Push Up", challengeDay: 1, challengeScore: 100, challengeMinReps: 8, challengeObjects: "Kursi", challengeDesc: ""),
       Challenge(challengeName: "Push Up", challengeDay: 1, challengeScore: 100, challengeMinReps: 8, challengeObjects: "Kursi", challengeDesc: ""),
       Challenge(challengeName: "Push Up", challengeDay: 1, challengeScore: 100, challengeMinReps: 8, challengeObjects: "Kursi", challengeDesc: ""),
       Challenge(challengeName: "Push Up", challengeDay: 1, challengeScore: 100, challengeMinReps: 8, challengeObjects: "Kursi", challengeDesc: "")

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "challengeCell", for: indexPath)
        let challenge = challenges[indexPath.row]
        
        cell.textLabel?.text = challenge.challengeName
        
        challengeName = challenge.challengeName
        cell.detailTextLabel?.text = "\(challenge.challengeScore)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let challenge = challenges[indexPath.row]
        performSegue(withIdentifier: "challengeInfoVC", sender: challenge)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let challengeInfoVC = segue.destination as? ChallengeInfoViewController {
            challengeInfoVC.tempChallengeName = challengeName
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
