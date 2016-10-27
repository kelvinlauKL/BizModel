//
//  KeyActivitiesViewController.swift
//  BizModel
//
//  Created by Kelvin Lau on 2016-10-13.
//  Copyright © 2016 Kelvin Lau. All rights reserved.
//

import UIKit
import RealmSwift


final class KeyActivitiesViewController: NotetakingViewController {
  
}

// MARK: - Life Cycle
extension KeyActivitiesViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    category = .keyActivities
    
    let realm = try! Realm()
    notes = realm.objects(Note.self).filter("category = %@", category.rawValue)
  }
}
