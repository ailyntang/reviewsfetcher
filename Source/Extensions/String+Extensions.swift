//
//  String+Extensions.swift
//  ReviewsFetcher
//
//  Created by Ai-Lyn Tang on 5/8/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit

extension String {

  /**
   Takes a string and returns a UIImage.
   
   - parameter string: A string containing a url address that is an image
   - returns: A UIImage based on the url string or a default image if the url string
   cannot be converted to an image.
  */
  func convertToImage(with imageView: UIImageView) {

    let url = URL(string: self)
    let session = URLSession(configuration: .default)

    let downloadImage = session.dataTask(with: url!) { (data, response, error) in

      if let error = error {
        print("Error downloading image: \(error)")

      } else {

        if let _ = response as? HTTPURLResponse {
          if let imageData = data {

            // Set UIImage
            let image = UIImage(data: imageData)!
            DispatchQueue.main.async(execute: {
              imageView.image = image
            })
          } else {
            print("Could not convert url data into an image")
          }

        } else {
          print("There was no response from the url")
        }
      }
    }
    downloadImage.resume()
  }

}
