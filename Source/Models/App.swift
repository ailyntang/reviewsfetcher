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
   The icon used by the app in the app store and on the phone
   */
  let icon: UIImage?

  /**
   The store of the app. The possible values are `apple`, `google_play` and `amazon`.
   */
  let store: String?

  /**
   The average rating of the app in its app store.
   TBD whether this is for the most current version or for all time.
   */
  let rating: Double?

  // MARK: Initialisation

  init(id: Int? = nil,
       name: String? = nil,
       icon: UIImage? = nil,
       store: String? = nil,
       rating: Double? = nil) {

    self.id = id
    self.name = name
    self.icon = icon
    self.store = store
    self.rating = rating
  }

}
