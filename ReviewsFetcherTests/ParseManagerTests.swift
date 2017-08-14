//
//  ParseManagerTests.swift
//  ReviewsFetcher
//
//  Created by Ai-Lyn Tang on 15/8/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import Foundation
import Quick
import Nimble
import SwiftyJSON

@testable import ReviewsFetcher

final class ParseManagerTests: QuickSpec {

  override func spec() {

    describe("Parsing an app overview") {

      // Arrangement

      var app = App()

      let url = Bundle.main.url(forResource: "StubAppOverview", withExtension: "json")

      context("when the json contains an app id") {

        it("should return an app with the parsed parameters") {

          // Action

          do {
            let data = try Data(contentsOf: url!)
            let json = JSON(data: data)
            app = ParseManager.parseAppOverview(from: json)
          } catch {
            print(error.localizedDescription)
          }

          // Assertion

          expect(app.id).to(equal(40332083066))
          expect(app.name).to(equal("Peoplecare"))
          expect(app.iconString).to(equal("http://is4.mzstatic.com/image/thumb/Purple117/v4/53/f7/3b/53f73bcc-512a-c205-d53c-a98f86c8cc4f/mzl.uyglrndh.png/100x100bb-85.jpg"))
          expect(app.store).to(equal("apple"))
          expect(app.releaseDate).to(equal("2014-10-22T00:00:00"))
          expect(app.updatedDate).to(equal("2017-05-30T21:46:04"))
        }
      }

      context("when the json does not contain an app") {

        it("should return an app with default parameters") {

        }
      }
    }
  }

}
