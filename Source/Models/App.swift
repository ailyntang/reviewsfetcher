//
//  App.swift
//  ReviewsFetcher
//
//  Created by Ai-Lyn Tang on 18/6/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import Foundation
import SwiftyJSON

struct App {
  
  let appIcon: UIImageView
  let appName: String
  let appId: Int
  let appleAppStoreStarRating: String
  let googlePlayStoreStarRating: String

  func parseDataFromJson(json: JSON) -> [App] {
    var newApps: [App]? = []

    if let arrayOfAllAttributes = json["results"].array {
      for app in arrayOfAllAttributes {
      }
    }

    return newApps!
  }
}
