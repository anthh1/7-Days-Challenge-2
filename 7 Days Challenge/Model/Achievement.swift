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
    var achievementJSON = ""
    var enable = false
    
    init(achievementName: String, achievementImg: UIImage, achievementJSON: String, enable: Bool) {
        self.achievementName = achievementName
        self.achievementImg = achievementImg
        self.achievementJSON = achievementJSON
        self.enable = enable
    }
    
    static func fetchAchievement() -> [Achievement]{
        return[
            Achievement(achievementName: "Well Done", achievementImg: UIImage(named: "well-done")!,achievementJSON: "well-done", enable: false),
            Achievement(achievementName: "300 Points", achievementImg: UIImage(named: "300points")!, achievementJSON: "heartbox", enable: false),
            Achievement(achievementName: "1000 Points", achievementImg: UIImage(named: "1000points")!,achievementJSON: "reward",enable: false),
            Achievement(achievementName: "7 Day Streak", achievementImg: UIImage(named: "7day-streak")!, achievementJSON: "7day-streak", enable: false),
            
        ]
        
    }
    
}
