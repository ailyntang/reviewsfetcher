//
//  AppTests.swift
//  ReviewsFetcher
//
//  Created by Ai-Lyn Tang on 17/7/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit
import Quick
import Nimble

@testable import ReviewsFetcher

final class AppTests: QuickSpec {

  override func spec() {

    describe("An app") {

      // Arrangement
      let id = 212243832
      let name = "Coles App"
      let icon = #imageLiteral(resourceName: "imgDefaultApp")
      let store = "apple"
      let rating = 3.8

      it("should have optional values for all its parameters") {

        // Action
        let app = App()

        // Assertion
        expect(app.id).to(beNil())
        expect(app.name).to(beNil())
        expect(app.icon).to(beNil())
        expect(app.store).to(beNil())
        expect(app.rating).to(beNil())
      }

      it("should initialise with the correct values") {

        // Action
        let app = App(id: id,
                      name: name,
                      icon: icon,
                      store: store,
                      rating: rating)

        // Assertion
        expect(app.id).to(equal(id))
        expect(app.name).to(equal(name))
        expect(app.icon).to(equal(#imageLiteral(resourceName: "imgDefaultApp")))
        expect(app.store).to(equal(store))
        expect(app.rating).to(equal(rating))
      }

    }
  }

}
