//
//  AppReviewsTableViewCell.swift
//  ReviewsFetcher
//
//  Created by Ai-Lyn Tang on 30/8/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit

final class AppReviewsTableViewCell: UITableViewCell {

  // MARK: IBOutlets

  @IBOutlet weak private var starLabel: UILabel!
  @IBOutlet weak private var dateAndVersionLabel: UILabel!
  @IBOutlet weak private var titleLabel: UILabel!
  @IBOutlet weak private var reviewLabel: UILabel!

  // MARK: Public Methods

  func setupAppReviews(with reviews: [AppReview]) {
    
  }

}
