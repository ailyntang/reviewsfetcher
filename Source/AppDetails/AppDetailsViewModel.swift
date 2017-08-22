//
//  AppDetailsViewModel.swift
//  ReviewsFetcher
//
//  Created by Ai-Lyn Tang on 23/8/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import Foundation

final class AppDetailsViewModel {

  // MARK: Conformance: AppDetailsViewModelType

  weak var delegate: AppDetailsViewModelDelegate?

  // MARK: Initialisation

  init() {
    
  }

}

// MARK: - Conformance: AppDetailsViewModelType

extension AppDetailsViewModel: AppDetailsViewModelType {

  func controllerDidAppear() {

  }


}
