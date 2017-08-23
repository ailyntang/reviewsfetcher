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

      let viewModelDelegateMock = HomeViewModelDelegateMock()

      context("when it has a nil input") {

        // Arrangement
        let viewModel = HomeViewModel(with: nil)

        it("displays the empty state") {

          // Action
          viewModel.controllerDidAppear()
          viewModel.delegate?.viewModel(viewModel, didUpdateIsListAvailableTo: false)

          // Assertion
          viewModelDelegateMock.didUpdateIsListAvailableExpectation = self.expectation(description: "didUpdateIsListAvailable should execute")
        }
      }

      context("when it has one app id input") {

        // Arrangement
        let viewModel = HomeViewModel(with: [40332083066])
        let app = App(id: 40332083066,
                      name: "Peoplecare",
                      iconString: "http://is4.mzstatic.com/image/thumb/Purple117/v4/53/f7/3b/53f73bcc-512a-c205-d53c-a98f86c8cc4f/mzl.uyglrndh.png/100x100bb-85.jpg",
                      store: "apple",
                      releaseDate: "2014-10-22T00:00:00",
                      updatedDate: "2017-05-30T21:46:04")

        it("makes a network call") {

        }

        it("returns a loading spinner for the duration of the call") {

        }

        it("displays a list of apps when the call is successful") {

          // Action
          viewModel.delegate?.viewModel(viewModel, didUpdateIsListAvailableTo: true)

          // Assertion
          viewModelDelegateMock.didUpdateIsListAvailableExpectation = self.expectation(description: "didUpdateIsListAvailable should execute")
        }



        it("updates the app overview with the fetched app") {

          // Action
          viewModel.delegate?.viewModel(viewModel, didUpdateAppOverviewTo: app)
        }

      }

      context("when it has more than one app id input") {

        it("sorts the apps in alphabetical order") {

        }
      }
    }
  }
}

// MARK: - Output Mock

private final class HomeViewModelDelegateMock: BaseViewModelDelegate {

  // MARK: Properties

  var isListAvailable: Bool?

  var app: App?

  var didUpdateAppOverviewExpectation: XCTestExpectation?

  func viewModel(_ viewModel: BaseViewModelType, didUpdateAppOverviewTo app: App) {
    self.app = app

    didUpdateAppOverviewExpectation?.fulfill()
  }

  func viewModel(_ viewModel: BaseViewModelType, didSortListBy appProperty: String) {

  }

  var didUpdateIsListAvailableExpectation: XCTestExpectation?

  func viewModel(_ viewModel: BaseViewModelType, didUpdateIsListAvailableTo isListAvailable: Bool) {
    self.isListAvailable = isListAvailable

    didUpdateIsListAvailableExpectation?.fulfill()
  }

  func viewModel(_ viewModel: BaseViewModelType, didUpdateActivityIndicatorStateTo activityIndicatorState: String) {

  }

}
