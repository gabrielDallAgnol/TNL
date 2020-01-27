//
//  ChallengeModel.swift
//  TNL
//
//  Created by Gabriel Schmit Dall Agnol on 24/01/20.
//  Copyright © 2020 Gabriel Schmit Dall Agnol. All rights reserved.
//

import Foundation
import ObjectMapper

struct Challenges: Mappable {
  
  var challenges = [ChallengeModel]()
  
  init?(map: Map) {
  }
  
  mutating func mapping(map: Map) {
    challenges             <- map["challenges"]
  }
}

struct ChallengeModel {
  
  var tags = [String]()
  
  var color: String!
  var status: String!
  var firstTitle: String?
  var secondTitle: String?
  var firstDescrition: String?
  var secondDescription: String?
  var itsHighlighted: String?
  
}

extension ChallengeModel: Mappable {
  
  init?(map: Map) {
  }
  
  mutating func mapping(map: Map) {
    tags                    <- map["tag"]
    color                   <- map["color"]
    firstTitle              <- map["firstTitle"]
    secondTitle             <- map["secondTitle"]
    firstDescrition         <- map["firstDescription"]
    secondDescription       <- map["secondDescription"]
    status                  <- map["stauts"]
    itsHighlighted          <- map["isHighlight"]
  }  
}
