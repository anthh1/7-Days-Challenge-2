//
//  ProfileView.swift
//  7 Days Challenge
//
//  Created by Anthony Angkasa on 04/04/20.
//  Copyright © 2020 Mini Challenge 1 - G19. All rights reserved.
//

import UIKit
import Lottie
import MobileCoreServices

class ProfileView: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var achievementCollectionView: UICollectionView!
    @IBOutlet var imageProfile: UIImageView!
    @IBOutlet var labelScore: UILabel!        
    @IBOutlet weak var seeVideoBtn: UIButton!

    var achievements = Achievement.fetchAchievement()
    var startCode = 0
    var animationJSON = ""
    var animationName = ""
    var achievementUnlock = UserDefaults.standard.integer(forKey: "Unlock")
    var dayStreak = UserDefaults.standard.integer(forKey: "DayStreak")
    var controller = UIImagePickerController()

    
    @IBAction func seeVideo(_ sender: Any) {
        controller.sourceType = UIImagePickerController.SourceType.photoLibrary
        controller.mediaTypes = [kUTTypeMovie as String]
        controller.delegate = self
            
        present(controller, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        achievementCollectionView.dataSource = self
                
        if UserDefaults.standard.integer(forKey: "Score") == 200{
            UserDefaults.standard.set(2, forKey: "Unlock")
        }
        
        if UserDefaults.standard.integer(forKey: "Score") == 900{
            UserDefaults.standard.set(3, forKey: "Unlock")
        }
        
        if UserDefaults.standard.integer(forKey: "DayStreak") == 7{
            UserDefaults.standard.set(4, forKey: "Unlock")
        }
        
        if achievementUnlock >= 1 {
            for n in 0...achievementUnlock-1 {
                achievements[n].enable = true
            }
        }
       
        labelScore.text = "Score: \(UserDefaults.standard.integer(forKey: "Score"))"
    }
    
        func startSegue(startCode: Int) {
            performSegue(withIdentifier: "achievementSegue", sender: self)
        }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? AchievementModal {
            destination.animationName = animationJSON
            destination.animationTitle = animationName
            
        }
    }
}

extension ProfileView: UICollectionViewDataSource, UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return achievements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AchievementCollectionViewCell", for: indexPath) as! AchievementCollectionViewCell
            
        let achievement = achievements[indexPath.item]
        cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap(_:))))
        
        cell.achievement = achievement
        
        if achievement.enable == false{
            cell.contentView.isHidden = true
        }
        else {
            cell.contentView.isHidden = false
        }
        return cell
    }
    
    @objc func tap(_ sender: UITapGestureRecognizer) {

       let location = sender.location(in: self.achievementCollectionView)
       let indexPath = self.achievementCollectionView.indexPathForItem(at: location)

       if let tempIndex = indexPath {
          print("Got clicked on index: \(tempIndex)!")
        let achievement = achievements[tempIndex.item]
        animationJSON = achievement.achievementJSON
        animationName = achievement.achievementName

        
        switch achievementUnlock {
        case 1:
            if tempIndex == [0, 0] {
                startSegue(startCode: 1)
            }
            else if tempIndex == [0, 1]{
                startSegue(startCode: 2)
            }
            else if tempIndex == [0, 2]{
                startSegue(startCode: 3)
            }
            else if tempIndex == [0, 3]{
                startSegue(startCode: 4)
            }
        case 2:
            if tempIndex == [0, 0] {
                startSegue(startCode: 1)
            }
            else if tempIndex == [0, 1]{
                startSegue(startCode: 2)
            }
        case 3:
            if tempIndex == [0, 0] {
                startSegue(startCode: 1)
            }
            else if tempIndex == [0, 1]{
                startSegue(startCode: 2)
            }
            else if tempIndex == [0, 2]{
                startSegue(startCode: 3)
            }
        case 4:
            if tempIndex == [0, 0] {
                startSegue(startCode: 1)
            }
            else if tempIndex == [0, 1]{
                startSegue(startCode: 2)
            }
            else if tempIndex == [0, 2]{
                startSegue(startCode: 3)
            }
            else if tempIndex == [0, 3]{
                startSegue(startCode: 4)
            }
        default:
            print("")
        }
       }
    }
}
