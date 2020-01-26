//
//  LoginViewWorker.swift
//  TNL
//
//  Created by Gabriel Schmit Dall Agnol on 25/01/20.
//  Copyright © 2020 Gabriel Schmit Dall Agnol. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class LoginViewWorker {
  
  func fetch() {
    let URL = "https://raw.githubusercontent.com/tristanhimmelman/AlamofireObjectMapper/d8bb95982be8a11a2308e779bb9a9707ebe42ede/sample_json"
    
    AF.request(URL).responseObject(completionHandler: { (response: AFDataResponse<ChallengeModel>) in
      
    })
  }
}
