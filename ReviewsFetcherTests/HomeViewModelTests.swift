//
//  HomeViewModelTests.swift
//  ReviewsFetcher
//
//  Created by Ai-Lyn Tang on 15/7/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import ReviewsFetcher

final class HomeViewModelTests: QuickSpec {

  override func spec() {

    describe("The loadApps method") {

      context("when it has a nil input") {

        // Arrangement
        let viewModel = HomeViewModel(with: nil)
        let viewModelDelegateMock = HomeViewModelDelegateMock()

        it("displays the empty state") {

          // Action
          viewModel.controllerDidAppear()
          viewModel.delegate?.viewModel(viewModel, didUpdateIsListAvailableTo: false)

          // Assertion
          viewModelDelegateMock.didUpdateIsListAvailableExpectation = self.expectation(description: "didUpdateIsListAvailable should be executed")
        }
      }

      context("when it has a non nil input") {

        // Arrangement
        let viewModel = HomeViewModel(with: [264519898208, 212243832])

        it("makes a network call") {

        }

        it("returns a loading spinner for the duration of the call") {

        }

        it("displays a list of apps when the call is successful") {
          viewModel.delegate?.viewModel(viewModel, didUpdateIsListAvailableTo: true)
        }

        it("sorts the apps in alphabetical order") {

        }

      }
    }
  }
}

// MARK: - Output Mock

private final class HomeViewModelDelegateMock: HomeViewModelDelegate {

  // MARK: Properties

  var isListAvailable: Bool?

  func viewModel(_ viewModel: HomeViewModelType, didUpdateAppOverviewTo app: App) {

  }

  func viewModel(_ viewModel: HomeViewModelType, didSortListBy appProperty: String) {

  }

  var didUpdateIsListAvailableExpectation: XCTestExpectation?

  func viewModel(_ viewModel: HomeViewModelType, didUpdateIsListAvailableTo isListAvailable: Bool) {
    self.isListAvailable = isListAvailable

    didUpdateIsListAvailableExpectation?.fulfill()
  }

  func viewModel(_ viewModel: HomeViewModelType, didUpdateActivityIndicatorStateTo activityIndicatorState: String) {

  }

}
