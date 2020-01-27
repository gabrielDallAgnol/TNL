//
//  ChallengesTableViewModel.swift
//  TNL
//
//  Created by Gabriel Schmit Dall Agnol on 25/01/20.
//  Copyright © 2020 Gabriel Schmit Dall Agnol. All rights reserved.
//

import UIKit

class ChallengesTableViewModel {

  private var challenges: [ChallengeModel]
  
  init(challenges: [ChallengeModel]) {
      self.challenges = challenges
    print(challenges)
  }
  
  required init?(coder aDecoder: NSCoder) {
      fatalError("\(#file) \(#function) not implemented")
  }
  
  func numberOfRowsInSection() -> Int {
    return challenges.count
  }
  
  func challengeForIndexPath(indexPath: IndexPath) -> ChallengeModel {
    return challenges[indexPath.row]
  }
  
}
