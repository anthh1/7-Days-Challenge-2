//
//  AchievementCollectionViewCell.swift
//  7 Days Challenge
//
//  Created by Calvin Leonardo on 12/04/20.
//  Copyright © 2020 Mini Challenge 1 - G19. All rights reserved.
//

import UIKit

class AchievementCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var achievementImgView: UIImageView!
    
    var achievement: Achievement! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI() {
        if let achievement = achievement {
            achievementImgView.image = achievement.achievementImg
        } else {
            print("")
        }
    }
}
