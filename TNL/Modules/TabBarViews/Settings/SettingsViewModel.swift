//
//  SettingsViewModel.swift
//  TNL
//
//  Created by Gabriel Schmit Dall Agnol on 27/01/20.
//  Copyright © 2020 Gabriel Schmit Dall Agnol. All rights reserved.
//

import UIKit

class SettingsViewModel {
  
  private var itens = [
    "Profile",
    "Push Notifications",
    "Submit Feedback",
    "Terms of Use",
    "Log out"
  ]
  
  private var itensImages = [
    "profile16Px",
    "notification16Px",
    "feedback16Px",
    "terms16Px",
    "logout16Px"
  ]
  
  func numberOfRowsInSection() -> Int{
    return itens.count
  }
  
  func titleForIndexPath(indexPath: IndexPath) -> String {
    return itens[indexPath.row]
  }
  
  func imageForIndexPath(indexPath: IndexPath) -> UIImage {
    return UIImage(named: itensImages[indexPath.row])!
  }
}

