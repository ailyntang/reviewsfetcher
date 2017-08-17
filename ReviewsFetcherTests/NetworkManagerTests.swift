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

    describe("The network manager") {

      // Arrangement
      var app = App()

      let auth = AuthenticationSecrets()
      let authSuccess = Authentication(username: auth.username,
                                       password: auth.password,
                                       clientKey: auth.clientKey)
      let authFailure = Authentication()

      context("when authentication succeeeds") {

        it("should fetch an app overview") {

          waitUntil(timeout: 4) { done in

            // Action
            NetworkManager.fetchAppOverview(auth: authSuccess, appId: 40332083066, completionHandler: { newApp in
              app = newApp

              // Assertion
              expect(app.name).to(equal("Peoplecare"))
              expect(app.id).to(equal(40332083066))
              expect(app.iconString).to(equal("http://is1.mzstatic.com/image/thumb/Purple127/v4/aa/27/95/aa2795b2-add6-6ece-2ba6-035d7900f60c/source/1280x1280bb.png"))
              expect(app.releaseDate).to(equal("2014-10-22T00:00:00"))
              expect(app.updatedDate).toNot(beNil())

              done()
            })
          }
        }
      }

      context("when authentication fails") {

        it("should return an error") {

          waitUntil(timeout: 4) { done in

            // Action
            NetworkManager.fetchAppOverview(auth: authFailure, appId: 40332083066, completionHandler: { newApp in
              app = newApp

              // Assertion
              expect(app.name).to(equal("Error: app not found"))
              expect(app.id).to(beNil())
              expect(app.iconString).to(beNil())
              expect(app.store).to(equal("n/a"))
              expect(app.releaseDate).to(equal("1900-01-01T00:00:00"))
              expect(app.updatedDate).toNot(beNil())

              done()
            })
          }
        }
      }
    }
  }
}
