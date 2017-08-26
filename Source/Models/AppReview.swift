//
//  AppReview.swift
//  ReviewsFetcher
//
//  Created by Ai-Lyn Tang on 26/8/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import Foundation

final class AppReview {

  // MARK: Public Properties

  let appId: Int?
  let title: String?
  let review: String?
  let stars: String?
  let version: String?
  let date: String?

  // MARK: Initialisation

  init(appId: Int? = nil,
       title: String? = nil,
       review: String? = nil,
       stars: String? = nil,
       version: String? = nil,
       date: String? = nil) {

    self.appId = appId
    self.title = title
    self.review = review
    self.stars = stars
    self.version = version
    self.date = date
  }

}
