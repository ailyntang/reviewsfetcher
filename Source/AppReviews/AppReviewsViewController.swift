//
//  AppReviewsViewController.swift
//  ReviewsFetcher
//
//  Created by Ai-Lyn Tang on 22/8/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit

final class AppReviewsViewController: UIViewController {

  // MARK: IBOutlets

  @IBOutlet fileprivate weak var label: UILabel!

  // MARK: Public Properties

  // TODO: how can we make this private? Think about using a delegate for the segue?
  var receivedAppId: Int?

  // MARK: Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    label.text = String(describing: receivedAppId)
  }


}
