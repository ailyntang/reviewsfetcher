//
//  AppTests.swift
//  ReviewsFetcher
//
//  Created by Ai-Lyn Tang on 17/7/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import ReviewsFetcher

final class AppTests: QuickSpec {

  override func spec() {

    describe("An app") {

      // Arrangement
      let id = 212243832
      let name = "Coles App"
      let iconString = "url"
      let store = "apple"
      let releaseDate = "2017-07-01"
      let updatedDate = "2017-08-01"

      it("should initialise when provided with no values") {

        // Action
        let app = App()

        // Assertion
        expect(app.id).to(beNil())
        expect(app.name).to(beNil())
        expect(app.iconString).to(beNil())
        expect(app.store).to(beNil())
        expect(app.releaseDate).to(beNil())
        expect(app.updatedDate).to(beNil())
      }

      it("should initialise when provided with all values") {

        // Action
        let app = App(id: id,
                      name: name,
                      iconString: iconString,
                      store: store,
                      releaseDate: releaseDate,
                      updatedDate: updatedDate)

        // Assertion
        expect(app.id).to(equal(id))
        expect(app.name).to(equal(name))
        expect(app.iconString).to(equal(iconString))
        expect(app.store).to(equal(store))
        expect(app.releaseDate).to(equal(releaseDate))
        expect(app.updatedDate).to(equal(updatedDate))
      }

      it("should initialise when provided with some values") {

        // Action
        let app = App(id: id,
                      name: name,
                      store: store,
                      updatedDate: updatedDate)

        // Assertion
        expect(app.id).to(equal(id))
        expect(app.name).to(equal(name))
        expect(app.store).to(equal(store))
        expect(app.updatedDate).to(equal(updatedDate))
        expect(app.iconString).to(beNil())
        expect(app.releaseDate).to(beNil())
      }
    }
  }

}
