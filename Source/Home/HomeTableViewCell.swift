//
//  HomeTableViewCell.swift
//  ReviewsFetcher
//
//  Created by Ai-Lyn Tang on 18/6/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
  
  //Properties
  @IBOutlet weak private var appImageView: UIImageView!
  @IBOutlet weak private var appNameLabel: UILabel!
  @IBOutlet weak private var appleAppStoreStarRatingLabel: UILabel!
  @IBOutlet weak private var googlePlayStoreStarRatingLabel: UILabel!
  
  // TODO: var appImage: UIImage. Not sure how this works.
  
  var appName: String? {
    didSet {
      appNameLabel.text = appName
    }
  }
  
  var appleAppStoreStarRating: String? {
    didSet {
      appleAppStoreStarRatingLabel.text = appleAppStoreStarRating
    }
  }
  
  var googlePlayStoreStarRating: String? {
    didSet {
      googlePlayStoreStarRatingLabel.text = googlePlayStoreStarRating
    }
  }
  
  
  
}
