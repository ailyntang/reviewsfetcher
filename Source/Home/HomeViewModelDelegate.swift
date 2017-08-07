//
//  HomeViewModelDelegate.swift
//  ReviewsFetcher
//
//  Created by Ai-Lyn Tang on 16/7/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit

protocol HomeViewModelDelegate: class {

  func viewModel(_ viewModel: HomeViewModelType, didUpdateActivityIndicatorStateTo activityIndicatorState: String)

  func viewModel(_ viewModel: HomeViewModelType, didUpdateAppNameTo name: String)

  func viewModel(_ viewModel: HomeViewModelType, didUpdateAppIconUrlStringTo urlString: String)

}
