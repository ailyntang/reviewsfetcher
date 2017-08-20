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

  // MARK: Properties

  fileprivate let dateFormatter = DateFormatter()

  // MARK: Public Methods

  func setupApp(app: App) {

    if let iconString = app.iconString {
      iconString.convertToImage(with: appImageView)
    } else {
      appImageView.image = #imageLiteral(resourceName: "imgDefaultApp")
    }
    
    appNameLabel.text = app.name
    storeLabel.text = app.store

    if app.releaseDate != nil {
      dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
      let releaseDate = dateFormatter.date(from: app.releaseDate!)
      let updatedDate = dateFormatter.date(from: app.updatedDate!)

      dateFormatter.dateFormat = "dd MMM yyyy"
      releaseDateLabel.text = dateFormatter.string(from: releaseDate!)
      updatedDateLabel.text = dateFormatter.string(from: updatedDate!)
    }
  }

}
