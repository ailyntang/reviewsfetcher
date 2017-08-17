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

      // Arrangement
      let viewModel = HomeViewModel()

      context("when it has a nil input") {

        // Action

        it("displays the empty state"){

        }
      }

      context("when it has a non nil input") {

        it("makes a network call") {

        }

        it("returns a loading spinner for the duration of the call"){

        }

        it("displays a list of apps when the call is successful"){

        }

      }
    }
  }
}
