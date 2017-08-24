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
   It uses this to make a network call to App Figures and returns an app.
   If there is an error, it will return `nil`.

   - parameter appId: an integer with the App Figures product id unique to every app
   - returns: an app populated with name, id, store, release data and updated date
   */

  // To activate the correct function, change the function name to be `fetchAppOverview`.
  // Change the unused function name to something different so it's not called.

  // MARK: - Call App Figures API (costs money)

  class func fetchAppOverview2(auth: Authentication, appId: Int, completionHandler: @escaping (App?) -> Void) {

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
        } else {
          completionHandler(nil)
        }

      } else {
        // TODO: this is where we handle the error state I think, but not sure how with completionHandler
        print("No data returned from network call")
        completionHandler(nil)
      }
    }
  }

  // MARK: - Use stub instead of App FIgures API (free)

  class func fetchAppOverview(auth: Authentication, appId: Int, completionHandler: @escaping (App?) -> Void) {

    let url = Bundle.main.url(forResource: "StubAppOverview", withExtension: "json")

    do {
      let data = try Data(contentsOf: url!)
      let json = JSON(data: data)
      if let app = ParseManager.parseAppOverview(from: json) {
        completionHandler(app)
      } else {
        completionHandler(nil)
      }
    } catch {
      completionHandler(nil)
    }
  }

  /**
   This function takes an `appId` that correlates to the product id used by App Figures.
   It uses this to make a network all to App Figures and returns the reviews for that app.
   If there is an error, it will return `nil`.
  */
  class func fetchAppReviews(auth: Authentication, appId: Int) {

  }

}
