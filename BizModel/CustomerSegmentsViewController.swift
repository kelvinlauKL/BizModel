//
//  CustomerSegmentsViewController.swift
//  BizModel
//
//  Created by Kelvin Lau on 2016-10-13.
//  Copyright © 2016 Kelvin Lau. All rights reserved.
//

import UIKit
import RealmSwift


final class CustomerSegmentsViewController: NotetakingViewController {
  
}

// MARK: - Life Cycle
extension CustomerSegmentsViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    category = .customerSegments
    
    let realm = try! Realm()
    notes = realm.objects(Note.self).filter("category = %@", category.rawValue)
  }
}
