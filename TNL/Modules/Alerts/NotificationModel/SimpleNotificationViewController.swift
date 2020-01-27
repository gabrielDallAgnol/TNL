//
//  SimpleNotificationViewController.swift
//  TNL
//
//  Created by Gabriel Schmit Dall Agnol on 24/01/20.
//  Copyright © 2020 Gabriel Schmit Dall Agnol. All rights reserved.
//

import UIKit

class SimpleNotificationViewController: UIViewController {
  
  var completionClosure: (()->())?
  
  var descriptionInfo: String!
  var titleModal: String?
  var titleButton: String?
  var textAlign: String?
  
  @IBOutlet weak var wrapperView: UIView! {
    didSet {
      wrapperView.setNeedsLayout()
      wrapperView.alpha = 0
    }
  }
  
  @IBOutlet weak var contentView: UIView! {
    didSet {
      contentView.layer.cornerRadius = 10.0
    }
  }
  
  @IBOutlet weak var understoodButton: UIButton! {
    didSet {
      understoodButton.addTarget(
        self,
        action: #selector(tappedCloseButton),
        for: .touchUpInside
      )
      
      
      understoodButton.setTitleColor(.white, for: .normal)
      understoodButton.backgroundColor = UIColor.turquoiseBlue
      understoodButton.layer.cornerRadius = understoodButton.frame.height / 2
    }
  }
  
  @IBOutlet weak var infoDescriptionLbl: UILabel! {
    didSet {
      infoDescriptionLbl.numberOfLines = 0
      infoDescriptionLbl.textColor = #colorLiteral(red: 0.2156862745, green: 0.2392156863, blue: 0.3725490196, alpha: 1)
      
    }
  }
  
  @IBOutlet weak var titleModalLbl: UILabel! {
    didSet {
      titleModalLbl.textAlignment = .center
      titleModalLbl.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
    }
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    setup()
  }
  
}

extension SimpleNotificationViewController {
  
  func setup() {
    
    titleModalLbl.text = titleModal
    
    let descriptionAttr = NSMutableAttributedString(attributedString: descriptionInfo.html2AttributedString!)
    descriptionAttr.replaceFont(with: UIFont.systemFont(ofSize: 15.0, weight: .semibold))
    infoDescriptionLbl.attributedText = descriptionAttr
    infoDescriptionLbl.textAlignment = .center
    
    if let buttonTitle = titleButton {
      let attributedString = NSMutableAttributedString(string: buttonTitle, attributes: [
        .font: UIFont.systemFont(ofSize: 14.0, weight: .bold),
        .foregroundColor: UIColor.whiteTwo
      ])
      understoodButton.setAttributedTitle(attributedString, for: .normal)
    }
    else {
      let attributedString = NSMutableAttributedString(string: "UNDERSTOOD", attributes: [
      .font: UIFont.systemFont(ofSize: 14.0, weight: .bold),
      .foregroundColor: UIColor.whiteTwo
      ])
      understoodButton.setAttributedTitle(attributedString, for: .normal)
    }
    
    contentView.center = CGPoint(
      x: contentView.center.x,
      y: wrapperView.frame.height + contentView.frame.height/2
    )


    UIView.animate(
      withDuration: 0.5,
      animations: {
        self.wrapperView.alpha = 1
    })

    UIView.animate(
      withDuration: 0.5,
      delay: 0,
      usingSpringWithDamping: 0.7,
      initialSpringVelocity: 10,
      options: UIView.AnimationOptions(rawValue: 0),
      animations: {
        self.contentView.center  = self.wrapperView.center
    })
  }
  
  @objc func tappedCloseButton() {
    
    UIView.animate(
      withDuration: 0.33,
      animations: {
        self.wrapperView.alpha = 0
    })
    
    UIView.animate(
      withDuration: 0.33,
      delay: 0,
      usingSpringWithDamping: 1,
      initialSpringVelocity: 10,
      options: UIView.AnimationOptions(rawValue: 0),
      animations: {
        self.contentView.center = CGPoint(
          x: self.contentView.center.x,
          y: self.contentView.frame.height + self.wrapperView.frame.height/2
        )
    }, completion: { (completed) in
      self.dismiss(animated: false, completion: {
        self.completionClosure?()
      })
    })
    
  }
}


