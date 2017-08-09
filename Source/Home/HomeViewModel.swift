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

  fileprivate var listOfAppIds: [String]?

  // MARK: Initialisation

  init(with listOfAppIds: [String]) {
    self.listOfAppIds = listOfAppIds
  }

}

// MARK: - Conformance: HomeViewModelType

extension HomeViewModel: HomeViewModelType {

  func controllerDidAppear() {

    NetworkManager.fetchAppOverview(appId: Int(212243832), completionHandler: { app in
      self.delegate?.viewModel(self, didUpdateAppNameTo: app.name!)
      self.delegate?.viewModel(self, didUpdateAppIconUrlStringTo: app.iconString!)
      self.delegate?.viewModel(self, didUpdateAppOverviewTo: app)
    })
  }

}
