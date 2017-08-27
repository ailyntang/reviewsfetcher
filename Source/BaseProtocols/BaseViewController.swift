//
//  BaseViewController.swift
//  ReviewsFetcher
//
//  Created by Ai-Lyn Tang on 27/8/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

  // MARK: Properties

  fileprivate var activityIndicator = UIActivityIndicatorView()

  // MARK: Public Methods

  func setupActivityIndicator(state: String) {
    activityIndicator.frame(forAlignmentRect: CGRect(x: 0, y: 0, width: 40, height: 40))
    activityIndicator.center = self.view.center
    activityIndicator.activityIndicatorViewStyle = .gray
    view.addSubview(activityIndicator)

    if state == "start" {
      activityIndicator.startAnimating()
    } else {
      activityIndicator.stopAnimating()
    }
  }
  
}
