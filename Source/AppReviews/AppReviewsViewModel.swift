//
//  AppReviewsViewModel.swift
//  ReviewsFetcher
//
//  Created by Ai-Lyn Tang on 23/8/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import Foundation

final class AppReviewsViewModel {

  // MARK: Conformance: BaseViewModelType

  weak var delegate: BaseViewModelDelegate?

  // MARK: Properties

  fileprivate var appId: Int?
  fileprivate var didUseApi: Bool = false

  // MARK: Initialisation

  init(with appId: Int? = nil, didUseApi: Bool) {
    self.appId = appId
    self.didUseApi = didUseApi
  }

}

// MARK: - Conformance: BaseViewModelType

extension AppReviewsViewModel: BaseViewModelType {

  func controllerDidAppear() {
    loadAppReviews(appId: appId)
  }

}

private extension AppReviewsViewModel {

  func loadAppReviews(appId: Int?) {
    delegate?.viewModel(self, didUpdateActivityIndicatorStateTo: "start")

    let authCredentials = AuthenticationSecrets()
    let auth = Authentication(username: authCredentials.username,
                              password: authCredentials.password,
                              clientKey: authCredentials.clientKey)

    if let appId = appId {
      NetworkManager.fetchAppReviews(auth: auth, appId: appId, completionHandler: { appReviews in

        if let appReviews = appReviews {
          self.delegate?.viewModel(self, didUpdateAppReviewsTo: appReviews)

        } else {
          // TODO: Hide table view
          print("API call returned nil for app reviews")
        }
      })
    } else {
      // TODO: Handle appId = nil. This could occur if the cell clicked was an error with no app id.
    }

    delegate?.viewModel(self, didUpdateActivityIndicatorStateTo: "stop")
  }

}
