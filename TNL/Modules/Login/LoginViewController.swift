//
//  LoginViewController.swift
//  TNL
//
//  Created by Gabriel Schmit Dall Agnol on 24/01/20.
//  Copyright © 2020 Gabriel Schmit Dall Agnol. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
  
  private var bottonConstant: CGFloat?
  private var viewModel: LoginViewModel
  
  // MARK: Outlets
  @IBOutlet weak var emailLabel: UILabel! {
    didSet {
      let attributedString = NSMutableAttributedString(string: "Email adress", attributes: [
        .font: UIFont.systemFont(ofSize: 14.0, weight: .regular),
      .foregroundColor: UIColor.brownishGrey ])
      
      emailLabel.attributedText = attributedString
    }
  }
  
  @IBOutlet weak var passwordLabel: UILabel! {
     didSet {
      let attributedString = NSMutableAttributedString(string: "Password", attributes: [
      .font: UIFont.systemFont(ofSize: 14.0, weight: .regular),
      .foregroundColor: UIColor.brownishGrey ])
      
      passwordLabel.attributedText = attributedString
     }
   }
   
  @IBOutlet weak var emailTextField: UITextField! {
     didSet {
      emailTextField.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
      emailTextField.textColor = UIColor.black
     }
   }
   
  @IBOutlet weak var passwordTextField: UITextField! {
     didSet {
      passwordTextField.isSecureTextEntry = true
      passwordTextField.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
      passwordTextField.textColor = UIColor.black
     }
   }
   
  @IBOutlet var divisorView: [UIView]! {
     didSet {
      divisorView.forEach { $0.backgroundColor = UIColor.lightGray }
     }
   }
   
  @IBOutlet weak var loginButton: UIButton! {
     didSet {
       loginButton.addTarget(
         self,
         action: #selector(tappedLoginButton),
         for: .touchUpInside
       )
       
       let attributedString = NSMutableAttributedString(string: "Login", attributes: [
       .font: UIFont.systemFont(ofSize: 14.0, weight: .bold),
       .foregroundColor: UIColor.whiteTwo ])
       
       loginButton.setAttributedTitle(attributedString, for: .normal)
       loginButton.backgroundColor = UIColor.turquoiseBlue
       loginButton.layer.cornerRadius = loginButton.frame.height / 2
     }
   }
   
  @IBOutlet weak var forgetPasswordButton: UIButton! {
     didSet {
       let attributedString = NSMutableAttributedString(string: "Forget Password", attributes: [
       .font: UIFont.systemFont(ofSize: 14.0, weight: .medium),
       .foregroundColor: UIColor.brownishGrey ])
       
       forgetPasswordButton.setAttributedTitle(attributedString, for: .normal)
       forgetPasswordButton.backgroundColor = UIColor.clear
     }
   }
   
  @IBOutlet weak var bottonConstraint: NSLayoutConstraint! {
    didSet {
      bottonConstant = bottonConstraint.constant
    }
  }
  
  init(viewModel: LoginViewModel) {
      self.viewModel = viewModel
      super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
      fatalError("\(#file) \(#function) not implemented")
  }
  

  // MARK: Override
  override func viewWillAppear(_ animated: Bool) {
    navigationController?.navigationBar.barStyle = .default
    self.navigationController?.navigationBar.isHidden = false
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    navigationController?.navigationBar.barStyle = .black
    self.navigationController?.navigationBar.isHidden = true
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setupKeyboard()
    
    setupNavigationBar()
    
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
  }
}

// MARK: Extension ViewController
private extension LoginViewController {
  
  private func setupNavigationBar() {
    
    self.navigationItem.title = "Login"
    
    let button = UIButton()
    button.adjustsImageWhenHighlighted = false
    button.setImage(UIImage(named: "arrowleft16Px"), for: .normal)
    button.addTarget(
      self,
      action: #selector(tappedBackButton),
      for: .touchUpInside
    )
    navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
    self.navigationController?.navigationBar.backgroundColor = .white
    navigationController?.navigationBar.barStyle = .default
    
  }
  
  @objc private func tappedBackButton() {
    navigationController?.popViewController(animated: true)
  }
  
  @objc private func tappedLoginButton() {
    navigationController?.pushViewController(viewModel.TabBarController(), animated: false)
  }
  
  @objc private func keyboardWillShow(notification:NSNotification){
    if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
        if view.frame.origin.y == 0{
            let height = keyboardSize.height
            self.bottonConstraint.constant = height + 50
        }
    }
  }
  
  @objc func keyboardWillHide(notification:NSNotification){
    bottonConstraint.constant = bottonConstant ?? 120
    
  }
  
}
