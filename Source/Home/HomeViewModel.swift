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

  weak var delegate: BaseViewModelDelegate?

  // MARK: Properties

  fileprivate var listOfAppIds: [Int]?
  
  fileprivate var didUseApi: Bool = false

  // MARK: Initialisation

  init(with listOfAppIds: [Int]?, didUseApi: Bool) {
    self.listOfAppIds = listOfAppIds
    self.didUseApi = didUseApi
  }
}

// MARK: - Conformance: HomeViewModelType

extension HomeViewModel: BaseViewModelType {

  func controllerDidAppear() {
    loadApps(appIds: listOfAppIds)
  }

}

// MARK: - Private Methods

private extension HomeViewModel {

  func loadApps(appIds: [Int]?) {
    self.delegate?.viewModel(self, didUpdateIsListAvailableTo: true)

    if let appIds = appIds {
      for id in appIds {
        loadApp(appId: id)
      }

    } else {
      print("There are no saved apps to display - add an app")
      self.delegate?.viewModel(self, didUpdateIsListAvailableTo: false)
    }
  }

  func loadApp(appId: Int) {

    let authCredentials = AuthenticationSecrets()
    let authentication = Authentication(username: authCredentials.username,
                                        password: authCredentials.password,
                                        clientKey: authCredentials.clientKey)

    self.delegate?.viewModel(self, didUpdateActivityIndicatorStateTo: "start")

    NetworkManager.fetchAppOverview(auth: authentication, appId: appId, completionHandler: { fetchedApp in

      var app: App

      if let fetchedApp = fetchedApp {
        app = fetchedApp
      } else {
        app = App()
      }

      self.delegate?.viewModel(self, didUpdateAppOverviewTo: app)
      self.delegate?.viewModel(self, didSortListBy: "name")
      self.delegate?.viewModel(self, didUpdateActivityIndicatorStateTo: "stop")
    })
  }
}
