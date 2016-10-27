//
//  UIView+Fadeable.swift
//  BizModel
//
//  Created by Kelvin Lau on 2016-10-13.
//  Copyright © 2016 Kelvin Lau. All rights reserved.
//

import UIKit

extension UIView {
  public func fade() {
    if let coverView = viewWithTag(1337) {
      UIView.animate(withDuration: 1.0, delay: 0, options: .allowUserInteraction, animations: {
        coverView.alpha = 0
      }, completion: { _ in
        coverView.removeFromSuperview()
      })
    } else {
      let coverView = UIView(frame: bounds)
      coverView.backgroundColor = .black
      coverView.alpha = 0.0
      coverView.tag = 1337
      addSubview(coverView)

      UIView.animate(withDuration: 1.0) {
        coverView.alpha = 0.5
      }
    }
  }
}
