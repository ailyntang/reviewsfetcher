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

  // MARK: Public Properties

  let icon: UIImage?
  let name: String?
  let id: Int?
  let appleRating: Double?
  let googleRating: Double?

  // MARK: Initialisation

  init(icon: UIImage? = nil,
       name: String? = nil,
       id: Int? = nil,
       appleRating: Double? = nil,
       googleRating: Double? = nil) {

    self.icon = icon
    self.name = name
    self.id = id
    self.appleRating = appleRating
    self.googleRating = googleRating
  }

  // MARK: Public Methods

  func parseDataFromJson(json: JSON) -> [App] {
    var newApps: [App]? = []

    if let arrayOfAllAttributes = json["results"].array {
      for app in arrayOfAllAttributes {
      }
    }

    return newApps!
  }
}
