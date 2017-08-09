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
  @IBOutlet weak private var storeLabel: UILabel!
  @IBOutlet weak private var releaseDateLabel: UILabel!
  @IBOutlet weak private var updatedDateLabel: UILabel!

  // MARK: Public Methods

  func setupApp(app: App) {
    app.iconString?.convertToImage(with: appImageView)
    appNameLabel.text = app.name
    storeLabel.text = app.store
    releaseDateLabel.text = app.releaseDate
    updatedDateLabel.text = app.updatedDate
  }

}
