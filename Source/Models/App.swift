//
//  App.swift
//  ReviewsFetcher
//
//  Created by Ai-Lyn Tang on 18/6/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import Foundation
import SwiftyJSON

/**
 The `App` model contains information about a given app live in an app store.
 */
struct App {

  // MARK: Public Properties

  /**
   `id` refers to the product id from App Figures. 
   This is different to the product id from iTunes or the Google Play Store.
  */
  let id: Int?

  /**
   The name of the app in the app store
   */
  let name: String?

  /**
   The icon used by the app in the app store and on the phone.
   This is a string of the url.
   */
  let iconString: String?

  /**
   The store of the app. The possible values are `apple`, `google_play` and `amazon`.
   */
  let store: String?

  /**
   The date string the app was released onto the app store.
   The date format is "2014-10-22T00:00:00"
   */
  let releaseDate: String?

  /**
   The date string the app was released onto the app store.
   The date format is "2014-10-22T00:00:00"
   */
  let updatedDate: String?

  /**
   The current version number on the app store.
  */
  let version: String?

  // MARK: Initialisation

  init(id: Int? = nil,
       name: String? = nil,
       iconString: String? = nil,
       store: String? = nil,
       releaseDate: String? = nil,
       updatedDate: String? = nil,
       version: String? = nil) {

    self.id = id
    self.name = name
    self.iconString = iconString
    self.store = store
    self.releaseDate = releaseDate
    self.updatedDate = updatedDate
    self.version = version
  }

}
