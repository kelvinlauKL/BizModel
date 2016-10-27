//
//  RevenueStreamsViewController.swift
//  BizModel
//
//  Created by Kelvin Lau on 2016-10-13.
//  Copyright © 2016 Kelvin Lau. All rights reserved.
//

import UIKit
import RealmSwift


final class RevenueStreamsViewController: NotetakingViewController {
  
}

// MARK: - Life Cycle
extension RevenueStreamsViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    category = .revenueStreams
    
    let realm = try! Realm()
    notes = realm.objects(Note.self).filter("category = %@", category.rawValue)
  }
}
