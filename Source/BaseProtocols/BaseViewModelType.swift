//
//  BaseViewModelType.swift
//  ReviewsFetcher
//
//  Created by Ai-Lyn Tang on 16/7/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import Foundation

protocol BaseViewModelType {

  weak var delegate: BaseViewModelDelegate? { get set }

  func controllerDidAppear()
}
