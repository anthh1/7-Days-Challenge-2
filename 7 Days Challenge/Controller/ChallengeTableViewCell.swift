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
        // Initialization code
        challengeNameLbl.numberOfLines = 2
        bgTable.layer.cornerRadius = 30


    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
}
