//
//  HomeViewController.swift
//  ReviewsFetcher
//
//  Created by Ai-Lyn Tang on 13/6/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

  // MARK: Properties

  private var viewModel: HomeViewModelType!

  fileprivate var activityIndicator = UIActivityIndicatorView()

  fileprivate var appName: String?

  fileprivate var appIconUrlString: String?

  // MARK: Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    viewModel = HomeViewModel(with: ["8968"])
    viewModel?.delegate = self
    viewModel?.controllerDidAppear()
    }

}

// MARK: - Conformance: HomeViewModelDelegate

extension HomeViewController: HomeViewModelDelegate {

  func viewModel(_ viewModel: HomeViewModelType, didUpdateActivityIndicatorStateTo activityIndicatorState: String) {
    setupActivityIndicator()

    if activityIndicatorState == "start" {
      activityIndicator.startAnimating()
    } else {
      activityIndicator.stopAnimating()
    }
  }

  func viewModel(_ viewModel: HomeViewModelType, didUpdateAppNameTo name: String) {
    appName = name
  }

  func viewModel(_ viewModel: HomeViewModelType, didUpdateAppIconUrlStringTo urlString: String) {
    appIconUrlString = urlString
  }

  func viewModel(_ viewModel: HomeViewModelType, didUpdateAppOverviewTo app: App) {
    appName = app.name
    appIconUrlString = app.iconString
  }

}

// MARK: - Conformance: UITableViewDataSource

extension HomeViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cellIdentifier = "HomeTableViewCell"

    guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? HomeTableViewCell else {
      fatalError("The dequeued cell is not an instance of HomeTableViewCell")
    }

    if let name = appName {
      cell.setAppName(name: name)
    }

    if let urlString = appIconUrlString {
      cell.setAppIcon(urlString: urlString)
    }
    
    return cell
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }

}

// MARK: - Private Methods

private extension HomeViewController {

  func setupActivityIndicator() {
    activityIndicator.frame(forAlignmentRect: CGRect(x: 0, y: 0, width: 40, height: 40))
    activityIndicator.center = self.view.center
    activityIndicator.activityIndicatorViewStyle = .gray
    view.addSubview(activityIndicator)
  }
}
