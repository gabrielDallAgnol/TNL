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
  
  func fetch(with completion: ((Challenges) -> (Void))?) {
    let URL = "https://my-json-server.typicode.com/gabrielDallAgnol/TNL/db"
    
    AF.request(URL).responseObject(completionHandler: { (response: AFDataResponse<Challenges>) in
      switch response.result {
      case .success(let challenges):
        completion!(challenges)
      case .failure( _):
        completion!(Challenges(JSON: ["challenges" : []])!)
      }
    })
  }
}
