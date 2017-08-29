//
//  HomeViewModelDelegate.swift
//  ReviewsFetcher
//
//  Created by Ai-Lyn Tang on 30/8/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import Foundation

protocol HomeViewModelDelegate: class {

  func viewModel(_ viewModel: BaseViewModelType, didUpdateAppOverviewTo app: App)

}
