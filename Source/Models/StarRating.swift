//
//  StarRating.swift
//  ReviewsFetcher
//
//  Created by Ai-Lyn Tang on 10/9/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit

final class StarRating: UIStackView {
  
  // MARK: Properties
  
  /**
   The rating corresponds to the number of filled stars that appear
  */
  var rating: Int? {
    didSet {
      setupStars(rating: rating)
    }
  }
  
  private var numberOfStars: Int = 5
  
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
    
    guard let rating = rating else {
      return
    }
    
    var images = [Bool](repeating: false, count: numberOfStars)
    
    for index in 0..<rating {
      images[index] = true
    }
    
    for index in 0..<numberOfStars {
      let star: UIImageView
      
      if images[index] {
        star = UIImageView(image: #imageLiteral(resourceName: "imgFilledStar"))
      } else {
        star = UIImageView(image: #imageLiteral(resourceName: "imgEmptyStar"))
      }
      
      addArrangedSubview(star)
    }
  }

}
