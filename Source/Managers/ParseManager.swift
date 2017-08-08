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

  static func parseAppOverview(from json: JSON) -> App {

    var newApp = App()

    if let _ = json["id"].int {

      let id = json["id"].intValue
      let name = json["name"].stringValue
      let iconString = json["icon"].stringValue
      let store = json["store"].stringValue
      let releaseDate = json["released_date"].stringValue
      let updatedDate = json["updated_date"].stringValue

      // TODO: delete rating from AppModel. It's not used here.
      let rating = 3.0

      newApp = App(id: id,
                   name: name,
                   iconString: iconString,
                   store: store,
                   rating: rating,
                   releaseDate: releaseDate,
                   updatedDate: updatedDate)

    } else if let errorMessage = json["message"].string {

      // TODO: Make this log an error in the debug log (see safefood)
      print("Error: \(errorMessage)")

    } else {
      print("No app id and no error message returned from json.")
    }

    return newApp
  }

}
