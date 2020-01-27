//
//  InProgressViewController.swift
//  TNL
//
//  Created by Gabriel Schmit Dall Agnol on 25/01/20.
//  Copyright © 2020 Gabriel Schmit Dall Agnol. All rights reserved.
//

import UIKit

class InProgressViewController: UIViewController {
  
  var descriptionToLabel: String?
  var titleToLabel: String?

  @IBOutlet weak var titleLabel: UILabel!{
    didSet {
      let attributedString = NSMutableAttributedString(string: (titleLabel.text ?? ""), attributes: [
        .font: UIFont.systemFont(ofSize: 18.0, weight: .bold),
        .foregroundColor: UIColor.black])
      
      titleLabel.attributedText = attributedString
      titleLabel.textAlignment = .center
      titleLabel.numberOfLines = 0
      titleLabel.baselineAdjustment = .alignCenters
    }
  }
  @IBOutlet weak var descriptionLabel: UILabel! {
    didSet {
      let attributedString = NSMutableAttributedString(string: (descriptionLabel.text ?? ""), attributes: [
        .font: UIFont.systemFont(ofSize: 16.0, weight: .regular),
        .foregroundColor: UIColor.brownishGrey])
      
      descriptionLabel.attributedText = attributedString
      descriptionLabel.numberOfLines = 0
      descriptionLabel.textAlignment = .center
      descriptionLabel.baselineAdjustment = .alignCenters
    }
  }
  
  init(description: String, title: String) {
      self.titleToLabel = title
      self.descriptionToLabel = description
      super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
      fatalError("\(#file) \(#function) not implemented")
  }
  
  override func viewDidLoad() {
    descriptionLabel.text = descriptionToLabel
    titleLabel.text = titleToLabel
  }
}
