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
  class func fetchAppOverview(auth: Authentication, appId: Int, completionHandler: @escaping (App) -> Void) {

    let urlBaseString = "https://api.appfigures.com/v2/products/"
    let urlString = "\(urlBaseString)\(appId)"

    let url = URL(string: urlString)!
    var request = URLRequest(url: url)

    request.setValue("Basic \(auth.authValue)", forHTTPHeaderField: "Authorization")
    request.setValue(auth.clientKey, forHTTPHeaderField: "X-Client-Key")
    request.httpMethod = "GET"

    Alamofire.request(request).responseData{ dataResponse in
      if let data = dataResponse.result.value {
        let json = JSON(data: data)
        if let app = ParseManager.parseAppOverview(from: json) {
          completionHandler(app)
        }

      } else {
        print("No data returned from network call")
      }
    }
  }

}
