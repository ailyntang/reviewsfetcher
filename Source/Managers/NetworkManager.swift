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

  // MARK: - Fetch App Overview

  /**
   This function takes an `appId` that correlates to the product id used by App Figures.
   It uses this to make a network call to App Figures and returns an app.
   If there is an error, it will return `nil`.

   - parameter appId: an integer with the App Figures product id unique to every app
   - returns: an app populated with name, id, store, release data and updated date
   */

  // To activate the correct function, change the function name to be `fetchAppOverview`.
  // Change the unused function name to something different so it's not called.

  // MARK: Call App Figures API (costs money)

  class func fetchAppOverviewUsingApi(auth: Authentication, appId: Int, completionHandler: @escaping (App?) -> Void) {

    let urlBaseString = "https://api.appfigures.com/v2/products/"
    let urlString = "\(urlBaseString)\(appId)"
    let url = URL(string: urlString)!

    let manager = NetworkManager()
    let request = manager.getRequest(auth: auth, url: url)

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

  // MARK: `fetchAppOverview` stub to avoid using App FIgures API in testing

  class func fetchAppOverviewUsingStub(auth: Authentication, appId: Int, completionHandler: @escaping (App?) -> Void) {

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

  // MARK: - Fetch app reviews

  /**
   This function takes an `appId` that correlates to the product id used by App Figures.
   It uses this to make a network all to App Figures and returns the reviews for that app.
   If there is an error, it will return `nil`.
  */
  class func fetchAppReviewsUsingApi(auth: Authentication, appId: Int, completionHandler: @escaping ([AppReview]?) -> Void) {

    let startDate = "2017-08-01"
    let endDate = "2017-08-23"
    //TODO: Update this so it's not just a fixed timeframe

    let urlBaseString = "https://api.appfigures.com/v2/reviews?&products="
    let urlString = "\(urlBaseString)\(appId)&start=\(startDate)&end=\(endDate)"
    let url = URL(string: urlString)!

    let manager = NetworkManager()
    let request = manager.getRequest(auth: auth, url: url)

    Alamofire.request(request).responseData{ dataResponse in
      if let data = dataResponse.result.value {
        let json = JSON(data: data)
        
        // TODO: need to update this. It's a dummy completion handler to compile.
        completionHandler(nil)
      }
    }
  }

  class func fetchAppReviewsUsingStub(auth: Authentication, appId: Int, completionHandler: @escaping ([AppReview]?) -> Void) {
    let url = Bundle.main.url(forResource: "StubAppReviewsColesApple", withExtension: "json")

    do {
      let data = try Data(contentsOf: url!)
      let json = JSON(data: data)
      if let reviews = ParseManager.parseAppReviews(from: json) {
        completionHandler(reviews)
      }

    } catch {
      completionHandler(nil)
    }

  }

}

private extension NetworkManager {

  func getRequest(auth: Authentication, url: URL) -> URLRequest {
    var request = URLRequest(url: url)

    request.setValue("Basic \(auth.authValue)", forHTTPHeaderField: "Authorization")
    request.setValue(auth.clientKey, forHTTPHeaderField: "X-Client-Key")
    request.httpMethod = "GET"

    return request
  }
}
