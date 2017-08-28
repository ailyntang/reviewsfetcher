//
//  AppReviewsViewController.swift
//  ReviewsFetcher
//
//  Created by Ai-Lyn Tang on 22/8/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit

final class AppReviewsViewController: BaseViewController {

  // MARK: Properties

  private var viewModel: BaseViewModelType!

  // MARK: IBOutlets

  @IBOutlet fileprivate weak var label: UILabel!

  // MARK: Public Properties

  // TODO: how can we make this private? Think about using a delegate for the segue?
  var receivedApp: App?

  // MARK: Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    viewModel = AppReviewsViewModel(with: nil)
    viewModel?.delegate = self
    viewModel?.controllerDidAppear()

    label.text = String(describing: receivedApp?.name)
  }

}

// MARK: - Conformance: BaseViewModelDelegate

extension AppReviewsViewController: BaseViewModelDelegate {

  func viewModel(_ viewModel: BaseViewModelType, didUpdateAppOverviewTo app: App) {

  }

  func viewModel(_ viewModel: BaseViewModelType, didSortListBy appProperty: String) {

  }

  func viewModel(_ viewModel: BaseViewModelType, didUpdateIsListAvailableTo isListAvailable: Bool) {

  }

  func viewModel(_ viewModel: BaseViewModelType, didUpdateActivityIndicatorStateTo activityIndicatorState: String) {
    self.setupActivityIndicator(state: activityIndicatorState)
  }

}
