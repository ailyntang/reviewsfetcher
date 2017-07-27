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

    if let idString = json["id"].string {

      let name = json["name"].string
      // TODO: read iconString and return UIImage
      //      let iconString = json["icon"].string
      let store = json["store"].string
      let rating = 3.0

      let id = Int(idString)
      let icon = #imageLiteral(resourceName: "imgDefaultApp")

      newApp = App(id: id, name: name, icon: icon, store: store, rating: rating)

    } else if let errorMessage = json["message"].string {

      // TODO: Make this log an error in the debug log (see safefood)
      print("Error: \(errorMessage)")

    } else {
      print("No app id and no error message returned from json.")
    }
    
    return newApp
  }

}
