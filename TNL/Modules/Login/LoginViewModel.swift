//
//  LoginViewModel.swift
//  TNL
//
//  Created by Gabriel Schmit Dall Agnol on 25/01/20.
//  Copyright © 2020 Gabriel Schmit Dall Agnol. All rights reserved.
//

import UIKit

class LoginViewModel {
  
  let worker = LoginViewWorker()
  
  func TabBarController(challenges: [ChallengeModel]) -> UITabBarController {
    
    let tabBarController = UITabBarController()
    tabBarController.navigationController?.navigationBar.barStyle = .default
    tabBarController.tabBar.unselectedItemTintColor = .darkGray
    tabBarController.tabBar.tintColor = .turquoiseBlue
    
    let item1 = UITabBarItem(
      title: "Challenges",
      image: #imageLiteral(resourceName: "tabBarChallenges"),
      tag: 0)
    let item2 = UITabBarItem(
      title: "Settings",
      image: #imageLiteral(resourceName: "tabBarSettings"),
      tag: 1
    )
    let item3 = UITabBarItem(
      title: "Leaderborder",
      image: #imageLiteral(resourceName: "tabBarLeaderboard"),
      tag: 2
    )
    let item4 = UITabBarItem(
      title: "Activity",
      image: #imageLiteral(resourceName: "tabBatActivity"),
      tag: 3
    )
    
    var mainVC: UIViewController!
    if challenges.isEmpty {
      mainVC = InProgressViewController(
        description: "Unfortunately has no challenges to you today.",
        title: "Ops..."
      )
    } else {
    let mainVM = ChallengesTableViewModel(challenges: challenges)
    mainVC = ChallengesTableViewController(viewModel: mainVM)
    }
    mainVC.tabBarItem = item1
    
    
    let settingsVC = SettingsTableViewController()
    settingsVC.tabBarItem = item2
    
    let leaderBorderVC = InProgressViewController(
      description: "Unfortunately this feature is not available yet, but register your email in the settings that we will notify you as soon as possible.",
      title: "Ops..."
    )
    leaderBorderVC.tabBarItem = item3
    
    let activityVC = InProgressViewController(
      description: "Unfortunately this feature is not available yet, but register your email in the settings that we will notify you as soon as possible.",
      title: "Ops..."
    )
    activityVC.tabBarItem = item4
    
    tabBarController.viewControllers = [mainVC,activityVC,leaderBorderVC,settingsVC]
    tabBarController.selectedViewController = mainVC

    return tabBarController
  }
  
  func isValidEmail(for email: String) -> Bool {
    return email.isValidEmail()
  }
  
  func isValisPassword(for password: String) -> Bool {
    if password.count > 7 {
      return true
    } else {
      return false
    }
  }
}
