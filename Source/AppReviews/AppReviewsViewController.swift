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

  fileprivate var reviews: [AppReview] = []

  // MARK: IBOutlets

  @IBOutlet fileprivate weak var appNameLabel: UILabel!

  @IBOutlet fileprivate weak var versionLabel: UILabel!

  // MARK: Public Properties

  // TODO: how can we make this private? Think about using a delegate for the segue?
  var receivedApp: App?

  // MARK: Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    viewModel = AppReviewsViewModel(with: receivedApp?.id)
    viewModel?.delegate = self
    viewModel?.controllerDidAppear()

    setupHeader(with: receivedApp)
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

  func viewModel(_ viewModel: BaseViewModelType, didUpdateAppReviewsTo reviews: [AppReview]) {
    self.reviews = reviews
  }

}

// MARK: - Conformance: UITableViewDataSource

extension AppReviewsViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return reviews.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellIdentifier = "AppReviewsTableViewCell"
    guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? AppReviewsTableViewCell else {
      fatalError("The dequeued cell is not an instance of AppReviewsTableViewCell")
    }

    let review = reviews[indexPath.row]
    cell.setupAppReview(with: review)
    return cell
  }

}

// MARK: - Private Methods

private extension AppReviewsViewController {

  func setupHeader(with app: App?) {

    if let app = app {
      appNameLabel.text = app.name

      let version = app.version ?? ": no version listed"
      let store = app.store ?? "No store listed"
      versionLabel.text = "Current version: \(version) (\(store))"

    } else {
      // TODO: Native alert to say go back one screen?
      // Or just push person back to the home scene?
      appNameLabel.text = "Uh-oh, something went wrong"
    }

  }
}
