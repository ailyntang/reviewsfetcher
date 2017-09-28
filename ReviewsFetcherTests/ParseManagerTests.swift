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

// TODO: How do we do this with the real API call? We'll need to change the assertions
// Right now this test is completely run on Stubs. 
// Would be more robust to run this on the real API, so we can catch changes 
// that will break our code. But that costs money.

final class ParseManagerTests: QuickSpec {

  override func spec() {

    // MARK: Parse app overview
    
    describe("Parsing an app overview") {

      // Arrangement
      var app: App?

      let urlAppOverview = Bundle.main.url(forResource: "StubAppOverview", withExtension: "json")
      let urlMessage = Bundle.main.url(forResource: "StubAppFiguresMessage", withExtension: "json")
      let urlUnexpected = Bundle.main.url(forResource: "StubNoMessageNoAppId", withExtension: "json")

      context("when the json contains an app id") {

        it("should return an app with the parsed parameters") {

          // Action
          do {
            let data = try Data(contentsOf: urlAppOverview!)
            let json = JSON(data: data)
            app = ParseManager.parseAppOverview(from: json)
          } catch {
            print(error.localizedDescription)
          }

          // Assertion
          expect(app).toNot(beNil())

          if let app = app {
            expect(app.id).to(equal(40332083066))
            expect(app.name).to(equal("Peoplecare"))
            expect(app.iconString).to(equal("http://is4.mzstatic.com/image/thumb/Purple117/v4/53/f7/3b/53f73bcc-512a-c205-d53c-a98f86c8cc4f/mzl.uyglrndh.png/100x100bb-85.jpg"))
            expect(app.store).to(equal("apple"))
            expect(app.releaseDate).to(equal("2014-10-22T00:00:00"))
            expect(app.updatedDate).to(equal("2017-05-30T21:46:04"))
          }
        }
      }

      context("when the json contains a message") {

        it("should return nil") {

          // Action
          do {
            let data = try Data(contentsOf: urlMessage!)
            let json = JSON(data: data)
            app = ParseManager.parseAppOverview(from: json)
          } catch {
            print(error.localizedDescription)
          }

          // Assertion
          expect(app).to(beNil())
        }
      }

      context("when the json has no app id and no message") {

        it("should return nil") {

          // Action
          do {
            let data = try Data(contentsOf: urlUnexpected!)
            let json = JSON(data: data)
            app = ParseManager.parseAppOverview(from: json)
          } catch {
            print(error.localizedDescription)
          }

          // Assertion
          expect(app).to(beNil())
        }
      }
    }

    // MARK: Parse app review
    
    describe("Parsing an app review") {
      
      // Arrangement
      var reviews: [AppReview]?
      
      let urlReview = Bundle.main.url(forResource: "StubAppReviewsColesApple", withExtension: "json")
      
      // Action
      do {
        let data = try Data(contentsOf: urlReview!)
        let json = JSON(data: data)
        reviews = ParseManager.parseAppReviews(from: json)
      } catch {
        print(error.localizedDescription)
      }
      
      // Assertion
      expect(reviews).toNot(beNil())

      context("when the json contains no null fields") {
        
        it("should return a review with the parsed parameters") {
        
          // Assertion
          if let reviews = reviews {
            let review = reviews[1]
            expect(review.appId).to(equal(212242352))
            expect(review.date).to(equal("2017-08-04T07:09:32"))
            expect(review.review).to(equal("It would be a great app if it showed the price of all items not just items that are on special. It seems to me that that's one of the main points of it- so I can check prices of things. Am I wrong?!"))
            expect(review.stars).to(equal("3.00"))
            expect(review.title).to(equal("Prices?"))
            expect(review.version).to(equal("3.1.6"))
          }
        }
      }
      
      context("when the json has a null title") {
        
        // Assertion
        if let reviews = reviews {
          let review = reviews[2]
          expect(review.appId).to(equal(212242352))
          expect(review.date).to(equal("2017-07-31T00:37:54"))
          expect(review.stars).to(equal("3.00"))
          expect(review.title).to(equal("-"))
          expect(review.version).to(equal("3.1.6"))
        }
      }
      
      context("when the json has a null review") {
        
        // Assertion
        if let reviews = reviews {
          let review = reviews[2]
          expect(review.appId).to(equal(212242352))
          expect(review.date).to(equal("2017-07-31T00:37:54"))
          expect(review.stars).to(equal("3.00"))
          expect(review.review).to(equal("-"))
          expect(review.version).to(equal("3.1.6"))
        }
      }
      
      context("when the json has a null field that is not title or review") {
        // TODO: add a new stub with null field. That will error. Put this in the arrangement
      }
      
    }
    
  }
}
