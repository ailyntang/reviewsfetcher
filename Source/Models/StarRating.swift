//
//  StarRating.swift
//  ReviewsFetcher
//
//  Created by Ai-Lyn Tang on 10/9/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit

final class StarRating: UIStackView {
  
  // MARK: Public Properties
  
  private var stars = [UIImageView]()
  
  /**
   The rating corresponds to the number of filled stars that appear
  */
  var rating: Int? {
    didSet {
      setupStars(rating: rating)
    }
  }
  
  // MARK: Properties
  
  private var numberOfStars: Int = 5
  
//  private var stars: [UIImageView]()
  
  // MARK: Initialization
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupStars(rating: rating)
  }
  
  required init(coder: NSCoder) {
    super.init(coder: coder)
    setupStars(rating: rating)
  }
  
  // MARK: Private Methods
  
  private func setupStars(rating: Int?) {
    
    // Clear existing stars
    for star in stars {
      removeArrangedSubview(star)
      star.removeFromSuperview()
    }
    
    stars.removeAll()
    
    // Exit if no rating is set
    guard let rating = rating else {
      return
    }
    
    // Set the number of "trues" in the array based on the star rating
    var images = [Bool](repeating: false, count: numberOfStars)
    
    for index in 0..<rating {
      images[index] = true
    }
    
    // Set the star image based on the star rating
    for index in 0..<numberOfStars {
      let star: UIImageView
      
      if images[index] {
        star = UIImageView(image: #imageLiteral(resourceName: "imgFilledStar"))
      } else {
        star = UIImageView(image: #imageLiteral(resourceName: "imgEmptyStar"))
      }
      
      // Add star image to the stack view
      addArrangedSubview(star)
      
      // Add star image to the array used to clear the stars
      stars.append(star)
    }
  }

}
