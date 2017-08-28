//
//  ParseManager.swift
//  ReviewsFetcher
//
//  Created by Ai-Lyn Tang on 28/7/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import Foundation
import SwiftyJSON

final class ParseManager {

  static func parseAppOverview(from json: JSON) -> App? {

    var newApp: App?

    if let _ = json["id"].int {

      let id = json["id"].intValue
      let name = json["name"].stringValue
      let iconString = json["icon"].stringValue
      let store = json["store"].stringValue
      let releaseDate = json["release_date"].stringValue
      let updatedDate = json["updated_date"].stringValue

      newApp = App(id: id,
                   name: name,
                   iconString: iconString,
                   store: store,
                   releaseDate: releaseDate,
                   updatedDate: updatedDate)

    } else if let errorMessage = json["message"].string {

      // This occurs when authentication fails, product id doesn't exist, or
      // app figures is called but doesn't recognise the url.
      let status = json["status"].stringValue
      print("Error: \(status) \(errorMessage)")

    } else {
      print("No app id and no error message returned from json. Not sure when we would get here.")
    }

    return newApp
  }

  static func parseAppReviews(from json: JSON) -> [AppReview]? {

    var appReviews: [AppReview] = []

    if let reviews = json["reviews"].array {
      for review in reviews {
        let appId     = review["product_id"].intValue
        let title     = review["title"].stringValue
        let appReview = review["review"].string ?? ""
        let stars     = review["stars"].stringValue
        let version   = review["version"].stringValue
        let date      = review["date"].stringValue

        let newReview = AppReview(appId: appId, title: title, review: appReview, stars: stars, version: version, date: date)
        appReviews.append(newReview)
      }
      return appReviews

    } else {
      return nil
    }
  }

}
