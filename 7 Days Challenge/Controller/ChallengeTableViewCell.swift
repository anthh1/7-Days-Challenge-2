//
//  ChallengeTableViewCell.swift
//  7 Days Challenge
//
//  Created by Calvin Leonardo on 08/04/20.
//  Copyright © 2020 Mini Challenge 1 - G19. All rights reserved.
//

import UIKit

class ChallengeTableViewCell: UITableViewCell {

    @IBOutlet weak var challengeImageBg: UIImageView!
    @IBOutlet weak var challengeDayLbl: UILabel!
    @IBOutlet weak var challengeNameLbl: UILabel!
    @IBOutlet weak var challengeScoreLbl: UILabel!
    @IBOutlet weak var bgTable: UIView!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()

        challengeNameLbl.numberOfLines = 2
        bgTable.layer.cornerRadius = 20
        self.selectedBackgroundView = UIView()
//      self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        animate()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20))
    }
    
    func animate() {
          UIView.animate(withDuration: 0.1,
        animations: {
            self.bgTable.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        },
            completion: { _ in
        UIView.animate(withDuration: 0.1) {
            self.bgTable.transform = CGAffineTransform.identity
            }
        })
    }
    
}
