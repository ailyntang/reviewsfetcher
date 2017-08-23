//
//  BaseViewModelDelegate.swift
//  ReviewsFetcher
//
//  Created by Ai-Lyn Tang on 16/7/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit

protocol BaseViewModelDelegate: class {

  func viewModel(_ viewModel: BaseViewModelType, didUpdateActivityIndicatorStateTo activityIndicatorState: String)

  func viewModel(_ viewModel: BaseViewModelType, didUpdateAppOverviewTo app: App)

  func viewModel(_ viewModel: BaseViewModelType, didUpdateIsListAvailableTo isListAvailable: Bool)

  func viewModel(_ viewModel: BaseViewModelType, didSortListBy appProperty: String)
  
}
