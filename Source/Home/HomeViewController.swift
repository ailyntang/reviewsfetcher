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
