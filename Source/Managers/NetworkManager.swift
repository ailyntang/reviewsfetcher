//
//  NetworkManager.swift
//  ReviewsFetcher
//
//  Created by Ai-Lyn Tang on 18/7/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

/**
 This class is responsible for all the network calls made from the app.
 */
final class NetworkManager {

  /**
   This function takes an `appId` that correlates to the product id used by App Figures.

   - parameter appId: an integer with the App Figures product id unique to every app
   */
  class func fetchApp(appId: Int, completionHandler: @escaping (App?) -> Void) {

    // TODO: I think there's an authentication issue here
    // So it always returns no app, even though in the browser the same URL returns an app
    let clientKey = "6cc908cce44e492f844fd7921b953878"
    let urlStringStart = "https://api.appfigures.com/v2/products/"
    let urlStringEnd = "?client_key="

    let urlString = "\(urlStringStart)\(appId)\(urlStringEnd)\(clientKey)"

    Alamofire.request(urlString).responseData{ dataResponse in

      var app = App()
      
      if let data = dataResponse.result.value {

        let json = JSON(data: data)
        app = App.parseAppOverview(from: json)
        completionHandler(app)

      } else {
        print("No data returned from network call")
      }
    }
  }

}
