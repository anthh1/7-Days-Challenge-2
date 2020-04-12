//
//  Achievement.swift
//  7 Days Challenge
//
//  Created by Calvin Leonardo on 12/04/20.
//  Copyright © 2020 Mini Challenge 1 - G19. All rights reserved.
//

import UIKit

class Achievement {
    
    var achievementName = ""
    var achievementImg: UIImage
    
    init(achievementName: String, achievementImg: UIImage) {
        self.achievementName = achievementName
        self.achievementImg = achievementImg
    }
    
    static func fetchAchievement() -> [Achievement]{
        return[
            Achievement(achievementName: "Achievement1", achievementImg: UIImage(named: "b1")!),
            Achievement(achievementName: "Achievement1", achievementImg: UIImage(named: "b1")!),
            Achievement(achievementName: "Achievement1", achievementImg: UIImage(named: "b1")!),

        ]
        
    }
    
}
