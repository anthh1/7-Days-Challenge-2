//
//  ProfileView.swift
//  7 Days Challenge
//
//  Created by Anthony Angkasa on 04/04/20.
//  Copyright © 2020 Mini Challenge 1 - G19. All rights reserved.
//

import UIKit
import Lottie
class ProfileView: UIViewController {

    @IBOutlet weak var achievementCollectionView: UICollectionView!
    @IBOutlet var imageProfile: UIImageView!
    @IBOutlet var labelScore: UILabel!
//    @IBOutlet var lottieView: UIView!
    
    var achievements = Achievement.fetchAchievement()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never

        achievementCollectionView.dataSource = self

        labelScore.text = "Score: \(UserDefaults.standard.integer(forKey: "Score"))"
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
        func startSegue(startCode: Int) {
            print(startCode)
            
            switch startCode {
            case 1:
                print("")
            case 2:
                print("")
            case 3:
                print("")
            case 4:
                print("")
            default:
                print("")
            }
            performSegue(withIdentifier: "achievementSegue", sender: self)

        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? AchievementModal {
           
            
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
        return cell
    }
    
    @objc func tap(_ sender: UITapGestureRecognizer) {

       let location = sender.location(in: self.achievementCollectionView)
       let indexPath = self.achievementCollectionView.indexPathForItem(at: location)
        
       if let tempIndex = indexPath {
          print("Got clicked on index: \(tempIndex)!")
        
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
       }

        
    
    }
}
