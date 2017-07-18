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

   - parameter appId: the App Figures product id unique to every app
   */
  func fetchApp(appId: Int, completionHandler: @escaping (Void) -> Void) {

    let clientKey = "6cc908cce44e492f844fd7921b953878"
    let urlStringStart = "https://api.appfigures.com/v2/products/"
    let urlStringEnd = "?client_key="

    let urlString = "\(urlStringStart)\(appId)\(urlStringEnd)\(clientKey)"

    Alamofire.request(urlString).responseData{ dataResponse in

      if let data = dataResponse.result.value {
        let json = JSON(data: data)
        let arrayOfApps = ["23432"]
        print("Woo hoo! \(arrayOfApps)")

        completionHandler()
      }
    }
  }

}
