//
//  ValuePropositionsViewController.swift
//  BizModel
//
//  Created by Kelvin Lau on 2016-10-13.
//  Copyright © 2016 Kelvin Lau. All rights reserved.
//

import UIKit
import RealmSwift


final class ValuePropositionsViewController: NotetakingViewController {
  
}

// MARK: - Life Cycle
extension ValuePropositionsViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    category = .valuePropositions
    
    let realm = try! Realm()
    notes = realm.objects(Note.self).filter("category = %@", category.rawValue)
  }
}
