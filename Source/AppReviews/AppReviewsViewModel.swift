//
//  AppReviewsViewModel.swift
//  ReviewsFetcher
//
//  Created by Ai-Lyn Tang on 23/8/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import Foundation

final class AppReviewsViewModel {

  // MARK: Conformance: AppDetailsViewModelType

  weak var delegate: BaseViewModelDelegate?

  // MARK: Properties

  fileprivate var appId: Int?

  // MARK: Initialisation

  init(with appId: Int? = nil) {
    self.appId = appId
  }

}

// MARK: - Conformance: AppDetailsViewModelType

extension AppReviewsViewModel: BaseViewModelType {

  func controllerDidAppear() {

  }

}

private extension AppReviewsViewModel {

  func loadAppReviews(appId: Int?) {

    if let appId = appId {
      NetworkManager.fetchAppReviews(appId: appId)

    } else {
      // Handle nil value
    }
  }

}
