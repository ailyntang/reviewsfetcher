//
//  UIImage+Extensions.swift
//  ReviewsFetcher
//
//  Created by Ai-Lyn Tang on 5/8/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit

extension UIImage {

  /**
   Takes a string and returns a UIImage.
   
   - parameter string: A string containing a url address that is an image
   - returns: A UIImage based on the url string or a default image if the url string
   cannot be converted to an image.
  */
  func fromUrlString(string: String) -> UIImage {

    var image = #imageLiteral(resourceName: "imgDefaultApp")

    if let url = URL(string: string) {
      DispatchQueue.global(qos: .background).async {
        if let data = try? Data(contentsOf: url, options: NSData.ReadingOptions.uncached) {
          DispatchQueue.main.async {
            image = UIImage(data: data)!
          }
        }
      }
    }
    return image
  }

}
