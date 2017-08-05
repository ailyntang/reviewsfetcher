//
//  HomeTableViewCell.swift
//  ReviewsFetcher
//
//  Created by Ai-Lyn Tang on 18/6/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit

final class HomeTableViewCell: UITableViewCell {
  
  // MARK: IBOutlets

  @IBOutlet weak private var appImageView: UIImageView!
  @IBOutlet weak private var appNameLabel: UILabel!
  @IBOutlet weak private var appleAppStoreStarRatingLabel: UILabel!
  @IBOutlet weak private var googlePlayStoreStarRatingLabel: UILabel!
  
  // TODO: var appImage: UIImage. Not sure how this works.
  
  // MARK: Properties

  var appName: String?
  
  var appleAppStoreStarRating: String?
  
  var googlePlayStoreStarRating: String?

  // MARK: Public Methods

  func setAppName(name: String) {
    appNameLabel.text = name
  }

}
