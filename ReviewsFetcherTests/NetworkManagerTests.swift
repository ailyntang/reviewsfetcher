//
//  NetworkManagerTests.swift
//  ReviewsFetcher
//
//  Created by Ai-Lyn Tang on 16/8/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import ReviewsFetcher

final class NetworkManagerTests: QuickSpec {

  override func spec() {

    describe("Fetching an app overview") {

      // Arrangement
      let auth = AuthenticationSecrets()
      let authSuccess = Authentication(username: auth.username,
                                       password: auth.password,
                                       clientKey: auth.clientKey)
      let authFailure = Authentication()

      context("when authentication succeeeds") {

        it("should return an app") {

          waitUntil(timeout: 4) { done in

            // Action
            NetworkManager.fetchAppOverview(auth: authSuccess, appId: 40332083066, completionHandler: { app in

              // Assertion
              expect(app).toNot(beNil())

              if let app = app {
                expect(app.name).to(equal("Peoplecare"))
                expect(app.id).to(equal(40332083066))
                expect(app.iconString).to(beAnInstanceOf(String.self))
                expect(app.releaseDate).to(equal("2014-10-22T00:00:00"))
                expect(app.updatedDate).to(beAnInstanceOf(String.self))
              }
              done()
            })
          }
        }
      }

      context("when authentication fails") {

        it("should return nil") {

          waitUntil(timeout: 4) { done in

            // Action
            NetworkManager.fetchAppOverview(auth: authFailure, appId: 40332083066, completionHandler: { app in

              // Assertion

              // Note this will fail if using the stub file instead of the real API call
              expect(app).to(beNil())
              done()
            })
          }
        }
      }
    }
  }
}
