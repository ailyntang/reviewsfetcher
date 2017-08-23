//
//  AppDetailsViewController.swift
//  ReviewsFetcher
//
//  Created by Ai-Lyn Tang on 22/8/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit

final class AppDetailsViewController: UIViewController {

  @IBOutlet weak var label: UILabel!

  var receivedAppId: Int?

  override func viewDidLoad() {
    super.viewDidLoad()

    label.text = String(describing: receivedAppId)
  }
}
