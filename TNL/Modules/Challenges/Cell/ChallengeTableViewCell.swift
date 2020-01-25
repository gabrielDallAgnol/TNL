//
//  ChallengeTableViewCell.swift
//  TNL
//
//  Created by Gabriel Schmit Dall Agnol on 25/01/20.
//  Copyright © 2020 Gabriel Schmit Dall Agnol. All rights reserved.
//

import UIKit

class ChallengeTableViewCell: UITableViewCell {

  @IBOutlet weak var backgroudView: UIView!
  @IBOutlet weak var superLabel: UILabel!
  @IBOutlet weak var tagsLabel: UILabel!
  @IBOutlet weak var topTitleLabel: UILabel!
  @IBOutlet weak var topDescriptionLabel: UILabel!
  @IBOutlet weak var midTitleLabel: UILabel!
  @IBOutlet weak var midDrescriptionLabel: UILabel!
  @IBOutlet weak var completeButton: UIButton!
  @IBOutlet weak var skipButton: UIButton!
  
  var cellColor: UIColor!
  var cellStatus: String!
  
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
