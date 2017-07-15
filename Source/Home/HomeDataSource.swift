//
//  HomeDataSource.swift
//  ReviewsFetcher
//
//  Created by Ai-Lyn Tang on 18/6/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit

final class HomeDataSource: NSObject {
  let apps: [App]
  
  init(apps: [App]){
    self.apps = apps
  }
}

extension HomeDataSource: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return apps.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as! HomeTableViewCell
    let app = apps[indexPath.row]
    
    cell.appName = app.appName
    cell.appleAppStoreStarRating = app.appleAppStoreStarRating
    cell.googlePlayStoreStarRating = app.googlePlayStoreStarRating
    
    return cell
  }
  
}
