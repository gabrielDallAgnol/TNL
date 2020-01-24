//
//  ViewController.swift
//  TNL
//
//  Created by Gabriel Schmit Dall Agnol on 23/01/20.
//  Copyright © 2020 Gabriel Schmit Dall Agnol. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  @IBOutlet weak var backgroundView: UIView! {
    didSet {
      backgroundView.backgroundColor = UIColor.darkBlueGrey
    }
  }
  
  @IBOutlet weak var backgroundImage: UIImageView! {
    didSet {
      backgroundImage.image = UIImage(named: "fill1")
    }
  }
  
  @IBOutlet weak var logoImage: UIImageView! {
    didSet {
      logoImage.image = UIImage(named: "logo")
    }
  }
  
  @IBOutlet weak var termsLabel: UILabel! {
    didSet {
      let attributedString = NSMutableAttributedString(string: "By using TNL, you agree to our Terms of Use and Privacy Policy", attributes: [
        .font: UIFont.systemFont(ofSize: 14.0, weight: .regular),
        .foregroundColor: UIColor.white ])
      attributedString.addAttributes([
        .font: UIFont.systemFont(ofSize: 14.0, weight: .bold),
        .foregroundColor: UIColor.whiteTwo
      ], range: NSRange(location: 31, length: 12))
      attributedString.addAttributes([
        .font: UIFont.systemFont(ofSize: 14.0, weight: .bold),
        .foregroundColor: UIColor.whiteTwo
      ], range: NSRange(location: 48, length: 14))
      
      termsLabel.attributedText = attributedString
      termsLabel.textAlignment = .center
      termsLabel.numberOfLines = 0
      termsLabel.lineBreakMode = .byWordWrapping
      termsLabel.adjustsFontSizeToFitWidth = true
      
    }
  }
  
  @IBOutlet weak var registerButton: UIButton! {
    didSet {
      registerButton.addTarget(
        self,
        action: #selector(tappedRegisterButton),
        for: .touchUpInside
      )
      
      let attributedString = NSMutableAttributedString(string: "Register", attributes: [
      .font: UIFont.systemFont(ofSize: 14.0, weight: .bold),
      .foregroundColor: UIColor.whiteTwo ])
      
      registerButton.setAttributedTitle(attributedString, for: .normal)
      registerButton.backgroundColor = UIColor.turquoiseBlue
      registerButton.layer.cornerRadius = registerButton.frame.height / 2
    }
  }
  
  @IBOutlet weak var loginButton: UIButton! {
    didSet {
      loginButton.addTarget(
        self,
        action: #selector(tappedLoginButton),
        for: .touchUpInside
      )
      
      let attributedString = NSMutableAttributedString(string: "Log in", attributes: [
      .font: UIFont.systemFont(ofSize: 14.0, weight: .bold),
      .foregroundColor: UIColor.whiteTwo ])
      
      loginButton.setAttributedTitle(attributedString, for: .normal)
      loginButton.backgroundColor = UIColor.white16
      loginButton.layer.cornerRadius = loginButton.frame.height / 2
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupLabelTouch()
  }
  
  private func setupLabelTouch() {
    let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.termsAndPrivacyGestureRecognizer(gesture:)))
    self.termsLabel.isUserInteractionEnabled = true
    self.termsLabel.addGestureRecognizer(labelTap)
  }
  
  @objc func termsAndPrivacyGestureRecognizer(gesture: UITapGestureRecognizer) {
    if gesture.didTapAttributedTextInLabel(label: termsLabel, inRange: NSRange(location: 31, length: 12)) {
      print("Tapped Terms")
    } else if gesture.didTapAttributedTextInLabel(label: termsLabel, inRange: NSRange(location: 48, length: 14)) {
      print("Tapped Privacy")
    } else {
      print("Tapped none")
    }
  }
  
  @objc func tappedLoginButton() {
    print("Go to Login")
  }
  
  @objc func tappedRegisterButton() {
    print("Go to Register")
  }
}

