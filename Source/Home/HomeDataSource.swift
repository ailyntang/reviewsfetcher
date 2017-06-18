//
//  HomeDataSource.swift
//  ReviewsFetcher
//
//  Created by Ai-Lyn Tang on 18/6/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import Foundation

final class HomeDataSource: NSObject {
  let apps: [App]
  
  init(apps: [App]){
    self.apps = apps
  }
}
