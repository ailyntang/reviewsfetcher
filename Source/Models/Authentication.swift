//
//  Authentication.swift
//  ReviewsFetcher
//
//  Created by Ai-Lyn Tang on 16/8/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import Foundation

final class Authentication {

  // MARK: Public Properties

  let authValue: String

  let clientKey: String

  // MARK: Constants

  private let username: String

  private let password: String

  // MARK: Initialisation

  init(username: String = "",
       password: String = "",
       clientKey: String = "") {

    self.username = username
    self.password = password
    self.clientKey = clientKey

    let authCredentials = "\(username):\(password)"
    let authData = authCredentials.data(using: String.Encoding.utf8)
    self.authValue = authData!.base64EncodedString(options: NSData.Base64EncodingOptions.lineLength64Characters)
  }

}
