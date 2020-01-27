//
//  ChallengeTableViewCell.swift
//  TNL
//
//  Created by Gabriel Schmit Dall Agnol on 25/01/20.
//  Copyright © 2020 Gabriel Schmit Dall Agnol. All rights reserved.
//

import UIKit

class ChallengeTableViewCell: UITableViewCell {
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
    let mockChallenge = ChallengeModel(tags: [],
                                       color: "",
                                       status: "todo",
                                       firstTitle: "",
                                       secondTitle: "",
                                       firstDescrition: "",
                                       secondDescription: "",
                                       itsHighlighted: "false")
    
    challenge = mockChallenge
  }
  
  var indexPath: IndexPath?
  private var challenge: ChallengeModel?
  {
    didSet {
      setupButtons()
      setupHighlight()
      setupLabels()
      setupColors()
    }
  }
  
  @IBOutlet weak var backgroudView: UIView! {
    didSet {
      backgroudView.layer.cornerRadius = 10
      backgroudView.layer.shadowColor = UIColor.lightGray.cgColor
      backgroudView.layer.shadowOpacity = 1
      backgroudView.layer.shadowOffset = .zero
      backgroudView.layer.shadowRadius = 5
    }
  }
  @IBOutlet var spacingSuperAndTagsLabels: NSLayoutConstraint!
  @IBOutlet var superWidth: NSLayoutConstraint!
  @IBOutlet weak var superLabel: UILabel!
  @IBOutlet weak var tagsLabel: UILabel!
  @IBOutlet weak var topTitleLabel: UILabel!
  @IBOutlet weak var topDescriptionLabel: UILabel!
  @IBOutlet weak var midTitleLabel: UILabel!
  @IBOutlet weak var midDrescriptionLabel: UILabel!
  @IBOutlet var completeButton: UIButton!
  @IBOutlet var completeWidth: NSLayoutConstraint!
  @IBOutlet var skipButton: UIButton!
  @IBOutlet var skipWidth: NSLayoutConstraint!
  
  var status: String!
  var color: UIColor!
  var isSuper: Bool!
  
  func setupCell(for challenge: ChallengeModel) {
    self.challenge = challenge
  }
  
  override func layoutSubviews() {
    setupButtons()
    setupHighlight()
    setupLabels()
    setupColors()
  }
}

private extension ChallengeTableViewCell {
  
  func setupLabels() {
    
    let superLabelAttributedString = NSMutableAttributedString(string: " SUPER    ", attributes: [
      .font: UIFont.systemFont(ofSize: 13.0, weight: .bold),
      .foregroundColor: UIColor.whiteTwo,])
    superLabel.attributedText = superLabelAttributedString
    superLabel.addImage(attribText: superLabelAttributedString ,imageName: "star_white")
    superLabel.textAlignment = .center
    superLabel.baselineAdjustment = .alignCenters
    superLabel.lineBreakMode = .byTruncatingMiddle
    superLabel.layer.masksToBounds = true
    superLabel.layer.cornerRadius = 5
    
    let tagsLabelAttributedString = NSMutableAttributedString(string: (setupTagString()), attributes: [
      .font: UIFont.systemFont(ofSize: 13.0, weight: .bold)])
    
    tagsLabel.attributedText = tagsLabelAttributedString
    tagsLabel.textAlignment = .center
    tagsLabel.baselineAdjustment = .alignCenters
    tagsLabel.lineBreakMode = .byTruncatingMiddle
    tagsLabel.layer.masksToBounds = true
    tagsLabel.layer.cornerRadius = 5
    
    let topTitleLabelAttributedString = NSMutableAttributedString(string: (challenge?.firstTitle ?? ""), attributes: [
      .font: UIFont.systemFont(ofSize: 16.0, weight: .regular)])
    
    topTitleLabel.attributedText = topTitleLabelAttributedString
    topTitleLabel.textAlignment = .left
    topTitleLabel.baselineAdjustment = .alignCenters
    
    let topDescriptionLabelAttributedString = NSMutableAttributedString(string: (challenge?.firstDescrition ?? ""), attributes: [
      .font: UIFont.systemFont(ofSize: 14.0, weight: .regular),
      .foregroundColor: UIColor.brownishGrey])
    
    topDescriptionLabel.attributedText = topDescriptionLabelAttributedString
    topDescriptionLabel.textAlignment = .left
    topDescriptionLabel.baselineAdjustment = .alignCenters
    
    let midTitleLabelAttributedString = NSMutableAttributedString(string: (challenge?.secondTitle ?? ""), attributes: [
      .font: UIFont.systemFont(ofSize: 16.0, weight: .semibold)])
    
    midTitleLabel.attributedText = midTitleLabelAttributedString
    midTitleLabel.textAlignment = .left
    midTitleLabel.baselineAdjustment = .alignCenters
    
    let midDrescriptionLabelAttributedString = NSMutableAttributedString(string: (challenge?.secondDescription ?? ""), attributes: [
      .font: UIFont.systemFont(ofSize: 14.0, weight: .light),
      .foregroundColor: UIColor.brownishGrey])
    
    midDrescriptionLabel.attributedText = midDrescriptionLabelAttributedString
    midDrescriptionLabel.textAlignment = .left
    midDrescriptionLabel.baselineAdjustment = .alignCenters
  }
  
  func setupHighlight() {
    
    if challenge?.itsHighlighted == "true" {
      isSuper = true
    } else {
      isSuper = false
    }
    
    
    if !isSuper {
      spacingSuperAndTagsLabels.constant = 0
      superWidth.constant = 0
      backgroudView?.layer.borderWidth = 0
    } else {
      superWidth.constant = 90
      spacingSuperAndTagsLabels.constant = 8
      backgroudView?.layer.borderWidth = 3
      backgroudView?.layer.borderColor = setupColor().cgColor
    }
  }
  
  
  func setupButtons() {
    skipButton.translatesAutoresizingMaskIntoConstraints = false
    completeButton.translatesAutoresizingMaskIntoConstraints = false
    
    status = challenge?.status
    
    skipButton.setTitle(" Skip", for: .normal)
    skipButton.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .bold)
    skipButton.backgroundColor = UIColor.clear
    skipButton.layer.cornerRadius = skipButton.frame.height / 2
    skipButton.setImage(UIImage(named: "not_interested"), for: .normal)
    skipButton.tintColor = UIColor.brownishGrey
    
    
    completeButton.setTitle(" Complete", for: .normal)
    completeButton.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .bold)
    completeButton.layer.cornerRadius = completeButton.frame.height / 2
    completeButton.setImage(UIImage(named: "check_white"), for: .normal)
    
    if status == "skip" {
      
      skipButton.setTitle("Skipped", for: .normal)
      completeWidth.constant = 0.0
      skipWidth.constant = 90.0
      
      skipButton.addTarget(
        self,
        action: #selector(tappedSkiped),
        for: .touchUpInside
      )
      
    } else if status == "complete" {
      
      completeButton.tintColor = color
      completeButton.backgroundColor = .clear
      completeButton.setTitle("Completed", for: .normal)
      skipWidth.constant = 0.0
      completeWidth.constant = 120.0
      
      completeButton.addTarget(
        self,
        action: #selector(tappedCompleted),
        for: .touchUpInside
      )
      
    } else if status == "todo" {
      
      skipWidth.constant = 90.0
      completeWidth.constant = 120.0
      completeButton.tintColor = .whiteTwo
      completeButton.backgroundColor = color
      
      skipButton.addTarget(
        self,
        action: #selector(tappedSkip),
        for: .touchUpInside
      )
      completeButton.addTarget(
        self,
        action: #selector(tappedComplete),
        for: .touchUpInside
      )
      
    }
    
    skipButton.reloadInputViews()
    completeButton.reloadInputViews()
  }
  
  func setupTagString() -> String {
    var tagsString = " "
    
    self.challenge?.tags.forEach { (tag) in
      tagsString.append(contentsOf: "\(tag.uppercased()), ")
    }
  
    if tagsString.trimmingCharacters(in: .whitespaces).isEmpty {
      tagsString = ""
    } else {
      tagsString.removeLast()
      tagsString.removeLast()
      tagsString.append("     ")
    }
    
    return tagsString
  }
  
  func setupColors() {
    color = setupColor()
    superLabel.backgroundColor = color
    tagsLabel.backgroundColor = UIColor.withAlphaComponent(color)(0.3)
    tagsLabel.textColor = color
  }
  
  func setupColor() -> UIColor {
    switch challenge?.color {
    case "gray":
      return .greyBlue
    case "blue":
      return .waterBlue
    case "red":
      return .vermillion
    case "orange":
      return .dustyOrange
    case "pink":
      return .cerise
    case "green":
      return .treeGreen
    case "purple":
      return .purpley
    case "waterGreen":
      return .tealish
    case "yellow":
      return .sunYellow
    default:
      return .sunYellow
    }
  }
  
  @objc func tappedSkip() {
    self.challenge?.status = "skip"
    self.setupCell(for: challenge!)
  }
  
  @objc func tappedComplete() {
    challenge?.status = "complete"
    self.setupCell(for: challenge!)
  }
  
  @objc func tappedCompleted() {
    challenge?.status = "todo"
    self.setupCell(for: challenge!)
  }
  
  @objc func tappedSkiped() {
    challenge?.status = "todo"
    self.setupCell(for: challenge!)
  }
}
