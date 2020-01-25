//
//  ViewController.swift
//  TNL
//
//  Created by Gabriel Schmit Dall Agnol on 23/01/20.
//  Copyright © 2020 Gabriel Schmit Dall Agnol. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {
  
  // MARK: Outlets
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
  
  // MARK: Override
  override func viewDidAppear(_ animated: Bool) {
    navigationController?.navigationBar.barStyle = .black
    self.navigationController?.navigationBar.isHidden = true
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupLabelTouch()
  }
}

// MARK: Extension ViewController
private extension LandingViewController {
  
  private func setupLabelTouch() {
    let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.termsAndPrivacyGestureRecognizer(gesture:)))
    self.termsLabel.isUserInteractionEnabled = true
    self.termsLabel.addGestureRecognizer(labelTap)
  }
  
  @objc func termsAndPrivacyGestureRecognizer(gesture: UITapGestureRecognizer) {
    if gesture.didTapAttributedTextInLabel(label: termsLabel, inRange: NSRange(location: 31, length: 12)) {

      let viewController = SimpleNotificationViewController()
      viewController.titleModal = "Terms of Use"
      viewController.descriptionInfo = "You are allowed to use <b>if you promisse tell about this app to all your friends</b>.<br>"
      viewController.titleButton = "ALL RIGHT"
      viewController.modalPresentationStyle = .overCurrentContext
      present(viewController, animated: false, completion: nil)
      
    } else if gesture.didTapAttributedTextInLabel(label: termsLabel, inRange: NSRange(location: 48, length: 14)) {
      
      let viewController = SimpleNotificationViewController()
      viewController.titleModal = "Privacy Policy"
      viewController.descriptionInfo = "<br>In Pregress. <br><br>But stay cool, <b>your privacy it's garanted</b>.<br>"
      viewController.titleButton = "AMAZING"
      viewController.modalPresentationStyle = .overCurrentContext
      present(viewController, animated: false, completion: nil)
      
    }
  }
  
  @objc func tappedLoginButton() {
    let viewController = LoginViewController()
    self.navigationController!.pushViewController(viewController, animated: true)
  }
  
  @objc func tappedRegisterButton() {
    let viewController = SimpleNotificationViewController()
    viewController.titleModal = "Ops..."
    viewController.descriptionInfo = "This feature still in development. <br><br>But fell free to <b>Login</b>, read our <b>Terms of Use</b> or give a look in the <b>Privacy Policy</b>."
    viewController.titleButton = "OK"
    viewController.modalPresentationStyle = .overCurrentContext
    present(viewController, animated: false, completion: nil)
  }
}

