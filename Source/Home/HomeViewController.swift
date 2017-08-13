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

  fileprivate var apps: [App] = []

  // MARK: IBOutlets

  @IBOutlet weak fileprivate var tableView: UITableView!

  @IBOutlet weak fileprivate var emptyListLabel: UILabel!

  // MARK: Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    viewModel = HomeViewModel()
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

  func viewModel(_ viewModel: HomeViewModelType, didUpdateAppOverviewTo app: App) {
    self.apps.append(app)
    self.tableView.reloadData()
  }

  func viewModel(_ viewModel: HomeViewModelType, didUpdateIsListAvailableTo isListAvailable: Bool) {
    self.tableView.isHidden = !isListAvailable
    self.emptyListLabel.isHidden = isListAvailable
  }

  func viewModel(_ viewModel: HomeViewModelType, didSortListBy appProperty: String) {
    if self.apps.count > 0 {
      self.apps.sort(by: { $0.name! < $1.name! } )
      self.tableView.reloadData()
    }
  }

}

// MARK: - Conformance: UITableViewDataSource

extension HomeViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return apps.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellIdentifier = "HomeTableViewCell"
    guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? HomeTableViewCell else {
      fatalError("The dequeued cell is not an instance of HomeTableViewCell")
    }

    // Fetches the approporiate app for the data source layout
    let app = apps[indexPath.row]
    cell.setupApp(app: app)
    
    return cell
  }

}

// MARK: - Conformance: UITableViewDelegate

extension HomeViewController: UITableViewDelegate {

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
