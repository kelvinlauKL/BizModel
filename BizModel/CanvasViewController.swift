//
//  CanvasViewController.swift
//  BizModel
//
//  Created by Kelvin Lau on 2016-10-13.
//  Copyright © 2016 Kelvin Lau. All rights reserved.
//

import UIKit

final class CanvasViewController: UIViewController {
  @IBOutlet fileprivate var containerViews: [UIView]!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    containerViews.forEach {
      $0.fade()
    }
  }
}

// MARK: - Life Cycle
extension CanvasViewController {
  override var prefersStatusBarHidden: Bool {
    return true
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)
    guard let touch = touches.first else { fatalError() }
    for containerView in containerViews {
      let location = touch.location(in: containerView)
      if containerView.bounds.contains(location) {
        containerView.fade()
      }
    }
  }
}

