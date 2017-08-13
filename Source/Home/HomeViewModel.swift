//
//  HomeViewModel.swift
//  ReviewsFetcher
//
//  Created by Ai-Lyn Tang on 15/7/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

/**
 This is a view model class, responsible for:
 
 - Receiving input from its corresponding controller
 - Notfiying its delegate of UI updates
 */
final class HomeViewModel {

  // MARK: Conformance: HomeViewModelType

  weak var delegate: HomeViewModelDelegate?

  // MARK: Properties

  fileprivate var listOfAppIds: [Int]?

  // MARK: Initialisation

  init(with listOfAppIds: [Int]) {
    self.listOfAppIds = listOfAppIds
  }

}

// MARK: - Conformance: HomeViewModelType

extension HomeViewModel: HomeViewModelType {

  func controllerDidAppear() {
    loadApps(appIds: listOfAppIds)
  }

}

// MARK: - Private Methods

private extension HomeViewModel {

  func loadApps(appIds: [Int]?) {

    if let appIds = appIds {
      for id in appIds {
        loadApp(appId: id)
      }
    } else {
      print("There are no saved apps to display - add an app")
    }
  }

  func loadApp(appId: Int) {
    self.delegate?.viewModel(self, didUpdateActivityIndicatorStateTo: "start")

    NetworkManager.fetchAppOverview(appId: appId, completionHandler: { app in
      self.delegate?.viewModel(self, didUpdateAppOverviewTo: app)
      self.delegate?.viewModel(self, didUpdateActivityIndicatorStateTo: "stop")
    })
  }
}
