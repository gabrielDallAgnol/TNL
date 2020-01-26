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
  
  func TabBarController() -> UITabBarController {
    
    let tabBarController = UITabBarController()
    tabBarController.tabBar.unselectedItemTintColor = .darkGray
    tabBarController.tabBar.tintColor = .turquoiseBlue
    
   
    
    let item1 = UITabBarItem(
      title: "Challenges",
      image: #imageLiteral(resourceName: "tabBarChallenges"),
      tag: 0
    )
    
    let mainVC = ChallengesTableViewController()
    mainVC.tabBarItem = item1
    
    let item2 = UITabBarItem(
      title: "Settings",
      image: #imageLiteral(resourceName: "tabBarSettings"),
      tag: 1
    )
    
    let settingsVC = SettingsViewController()
    settingsVC.tabBarItem = item2
    
    let item3 = UITabBarItem(
      title: "Leaderborder",
      image: #imageLiteral(resourceName: "tabBarLeaderboard"),
      tag: 2
    )
    
    let leaderBorderVC = InProgressViewController()
    leaderBorderVC.tabBarItem = item3
    
    let item4 = UITabBarItem(
      title: "Activity",
      image: #imageLiteral(resourceName: "tabBatActivity"),
      tag: 3
    )
    
    let activityVC = InProgressViewController()
    activityVC.tabBarItem = item4
    
    tabBarController.viewControllers = [mainVC,activityVC,leaderBorderVC,settingsVC]
    tabBarController.selectedViewController = mainVC

    return tabBarController
  }
}
