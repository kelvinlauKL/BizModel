//
//  ChannelsViewController.swift
//  BizModel
//
//  Created by Kelvin Lau on 2016-10-13.
//  Copyright © 2016 Kelvin Lau. All rights reserved.
//

import UIKit
import RealmSwift


final class ChannelsViewController: NotetakingViewController {
  
}

// MARK: - Life Cycle
extension ChannelsViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    category = .channels
    
    let realm = try! Realm()
    notes = realm.objects(Note.self).filter("category = %@", category.rawValue)
  }
}
