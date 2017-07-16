//
//  HomeViewModel.swift
//  ReviewsFetcher
//
//  Created by Ai-Lyn Tang on 15/7/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

/**
 This is a view model class, responsible for:
 
 - Receiving input from its corresponding controller
 - Notfiying its delegate of UI updates
 */
final class HomeViewModel {

  // MARK: Properties

  private var listOfAppIds: [String]?

  // MARK: Initialisation

  init(with listOfAppIds: [String]) {
    self.listOfAppIds = listOfAppIds
  }

  // MARKK: Public Methods

  func reloadViews() {

    fetchApps(appIds: listOfAppIds!, completionHandler: { myApp in
      print(myApp)
    })
  }

}

// MARK: Private Methods
private extension HomeViewModel {

  func fetchApps(appIds: [String], completionHandler: @escaping (Void) -> Void) {
    let urlString = "http://swapi.co/api/people/"

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
