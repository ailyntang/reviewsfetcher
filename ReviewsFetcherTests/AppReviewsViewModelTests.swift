//
//  AppReviewsViewModelTests.swift
//  ReviewsFetcher
//
//  Created by Ai-Lyn Tang on 24/8/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import ReviewsFetcher

final class AppReviewsViewModelTests: QuickSpec {

  override func spec() {

    describe("The app reviews view") {

      // Arrangement
      let viewModel = AppReviewsViewModel()
      
      context("when it is loaded") {

        // Action
        viewModel.controllerDidAppear()

        it("should make a network call to retrieve the app reviews") {

          // Assertion
          // How do I test this? I want to keep the network call private in the view model
        }

      }

    }

  }
}
