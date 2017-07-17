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

    describe(".viewDidAppear") {

      context("when the API call is made") {

        it("returns a loading spinner for the duration of the call"){

        }

        it("returns an error if the API call fails"){

        }

        it("returns a list of Apps if the API call is successful"){

        }
      }
    }
  }
}
