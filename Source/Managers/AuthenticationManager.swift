//
//  AuthenticationManager.swift
//  ReviewsFetcher
//
//  Created by Ai-Lyn Tang on 31/7/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import Foundation
import OAuthSwift

final class AuthenticationManager {

  // MARK: Public Method

  class func authenticateWithoutAuthorisation2() {

    // create an instance and retain it
    let oauthswift = OAuth1Swift(
      consumerKey:    "yBhDKr7lAtAATcM9VreoqF3GK",
      consumerSecret: "Mv825NRChcqR5GVwC9TJD7RsvHq6Qg9lZVgeD4xhuKuEaVWMD0",
      requestTokenUrl: "https://api.twitter.com/oauth/request_token",
      authorizeUrl:    "https://api.twitter.com/oauth/authorize",
      accessTokenUrl:  "https://api.twitter.com/oauth/access_token"
    )

    // authorize
    // Callback URLs tried
//"oauth-swift://oauth-callback/appfigures"
    // "oob" generates request error -11

    let url1 = "https://api.appfigures.com/v2/products/40332083066?"
    let url2 = "oauth-swift://oauth-callback/reviewsFetcher"

    // retain error -10, I put this into the callback URL on the Twitter settings page
    let url3 = "http://oauthswift.herokuapp.com/callback/twitter"

    // retain error -10. Twitter doesn't recognise this as a valid URL on the Twitter settings page
    let url4 = "oauth-swift://oauth-callback/twitter"

    let handle = oauthswift.authorize(
      withCallbackURL: URL(string: url4)!,
      success: { credential, response, parameters in
        print(credential.oauthToken)
        print(credential.oauthTokenSecret)
        print(parameters["user_id"])
        // Do your request
    },
      failure: { error in
        print(error.localizedDescription)
    }
    )
  }

  // Builds but I can't figure out the callback URL, so it neither succeeds nor fails
  class func authenticateWithAuthorisation() {

    // create an instance and retain it
    let oauthswift = OAuth1Swift(
      consumerKey:    "6cc908cce44e492f844fd7921b953878",
      consumerSecret: "a72e958e98f74042adcabcc9ef0a88cd",
      requestTokenUrl: "https://api.appfigures.com/v2/oauth/request_token",
      authorizeUrl:    "https://api.appfigures.com/v2/oauth/authorize",
      accessTokenUrl:  "https://api.appfigures.com/v2/oauth/access_token"
    )

    // authorize
    let handle = oauthswift.authorize(
//      withCallbackURL: URL(string: "oauth-swift://oauth-callback/twitter")!,
      withCallbackURL: URL(string: "https://api.appfigures.com/v2")!,
      success: { credential, response, parameters in
        print(credential.oauthToken)
        print(credential.oauthTokenSecret)
        print(parameters["user_id"])
        // Do your request
    },
      failure: { error in
        print(error.localizedDescription)
    }
    )
  }

  // Builds but always fails as access token is invalid
  // I have tried with the & and without the & at the end of the consumer secret
  class func authenticateWithoutAuthorisation() {

    // create an instance and retain it
//    let oauthswift = OAuth1Swift(
//      consumerKey:    "6cc908cce44e492f844fd7921b953878",
//      consumerSecret: "a72e958e98f74042adcabcc9ef0a88cd&",
//      requestTokenUrl: "https://api.appfigures.com/v2/oauth/request_token",
//      authorizeUrl:    "https://api.appfigures.com/v2/oauth/authorize",
//      accessTokenUrl:  "https://api.appfigures.com/v2/oauth/access_token"
//    )

    let oauthswift = OAuth1Swift(
      consumerKey:    "yBhDKr7lAtAATcM9VreoqF3GK",
      consumerSecret: "Mv825NRChcqR5GVwC9TJD7RsvHq6Qg9lZVgeD4xhuKuEaVWMD0",
      requestTokenUrl: "https://api.twitter.com/oauth/request_token",
      authorizeUrl:    "https://api.twitter.com/oauth/authorize",
      accessTokenUrl:  "https://api.twitter.com/oauth/access_token"
    )

    // do your HTTP request without authorize
//    oauthswift.client.get("https://api.appfigures.com/v2/products/40332083066?",
//                          success: { response in
//                            //....
//                            print("Authentication success!")
//    },
//                          failure: { error in
//                            print("Authentication failure")
//                            print(error)
//    }
//    )


    let _ = oauthswift.client.get(
      "https://api.twitter.com/1.1/statuses/mentions_timeline.json", parameters: [:],
      success: { response in
        let jsonDict = try? response.jsonObject()
        print(String(describing: jsonDict))
    }, failure: { error in
      print(error)
    }
    )

  }

}
