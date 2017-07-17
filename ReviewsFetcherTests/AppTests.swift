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
      let icon = #imageLiteral(resourceName: "imgDefaultApp")
      let name = "Coles App"
      let id = 212243832
      let appleRating = 3.4
      let googleRating = 3.8

      it("should have optional values for all its parameters") {

        // Action
        let app = App()

        // Assertion
        expect(app.icon).to(beNil())
        expect(app.name).to(beNil())
        expect(app.id).to(beNil())
        expect(app.appleRating).to(beNil())
        expect(app.googleRating).to(beNil())
      }

      it("should initialise with the correct values") {

        // Action
        let app = App(icon: icon,
                      name: name,
                      id: id,
                      appleRating: appleRating,
                      googleRating: googleRating)

        // Assertion
        expect(app.icon).to(equal(#imageLiteral(resourceName: "imgDefaultApp")))
        expect(app.name).to(equal(name))
        expect(app.id).to(equal(id))
        expect(app.appleRating).to(equal(appleRating))
        expect(app.googleRating).to(equal(googleRating))
      }

    }
  }

}
