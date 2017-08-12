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
  class func fetchAppOverview(appId: Int, completionHandler: @escaping (App) -> Void) {

    let urlBaseString = "https://api.appfigures.com/v2/products/"
    let urlString = "\(urlBaseString)\(appId)"

    let url = URL(string: urlString)!
    var request = URLRequest(url: url)

    let authentication = AuthenticationSecrets()
    let authCredentials = "\(authentication.username):\(authentication.password)"
    let authData = authCredentials.data(using: String.Encoding.utf8)
    let authVal = authData!.base64EncodedString(options: NSData.Base64EncodingOptions.lineLength64Characters)

    request.setValue("Basic \(authVal)", forHTTPHeaderField: "Authorization")
    request.setValue(authentication.clientKey, forHTTPHeaderField: "X-Client-Key")
    request.httpMethod = "GET"

    Alamofire.request(request).responseData{ dataResponse in
      var app = App()
      
      if let data = dataResponse.result.value {
        let json = JSON(data: data)
        app = ParseManager.parseAppOverview(from: json)
        completionHandler(app)

      } else {
        print("No data returned from network call")
      }
    }
  }

}
    // MARK: Stub

    // TODO: Remove this stub once I figure out OAuth 1. Right now it's dummy data.

    let url = Bundle.main.url(forResource: "StubAppOverview", withExtension: "json")

    var app = App()

    do {
      let data = try Data(contentsOf: url!)
      let json = JSON(data: data)
      app = ParseManager.parseAppOverview(from: json)
      completionHandler(app)
    } catch {
      print(error.localizedDescription)
    }
  }

}
