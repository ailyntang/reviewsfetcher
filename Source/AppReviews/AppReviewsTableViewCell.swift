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

  // MARK: Properties

  private var dateFormatter = DateFormatter()

  // MARK: Public Methods

  func setupAppReview(with review: AppReview) {
    starLabel.text = "\(review.stars) stars"

    // Read date string from `AppReview` model
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    let reviewDate = dateFormatter.date(from: review.date)

    // Transform date into desired format
    dateFormatter.dateFormat = "dd MMM yyyy"
    let reviewDateString = dateFormatter.string(from: reviewDate!)

    dateAndVersionLabel.text = "\(reviewDateString) (\(review.version))"

    if let title = review.title {
      titleLabel.text = title
    }

    if let review = review.review {
      reviewLabel.text = review
    }
  }

}
