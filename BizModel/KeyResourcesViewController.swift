//
//  KeyResourcesViewController.swift
//  BizModel
//
//  Created by Kelvin Lau on 2016-10-13.
//  Copyright © 2016 Kelvin Lau. All rights reserved.
//

import UIKit
import RealmSwift


final class KeyResourcesViewController: NotetakingViewController {
  
}

// MARK: - Life Cycle
extension KeyResourcesViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    category = .keyResources
    
    let realm = try! Realm()
    notes = realm.objects(Note.self).filter("category = %@", category.rawValue)
  }
}
