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

  // MARK: Initialisation

  init() {
    
  }

}

// MARK: - Conformance: AppDetailsViewModelType

extension AppReviewsViewModel: BaseViewModelType {

  func controllerDidAppear() {

  }


}
