//
//  StarRating.swift
//  ReviewsFetcher
//
//  Created by Ai-Lyn Tang on 10/9/17.
//  Copyright © 2017 Ai-Lyn Tang. All rights reserved.
//

import UIKit

final class StarRating: UIStackView {
  
  // MARK: Initialization
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupStars()
  }
  
  required init(coder: NSCoder) {
    super.init(coder: coder)
    setupStars()
  }
 
  // MARK: Private Methods
  
  private func setupStars() {
    
    for _ in 0..<5 {
      let star = UIImageView(image: #imageLiteral(resourceName: "imgEmptyStar"))
      addArrangedSubview(star)
    }
  }
}
