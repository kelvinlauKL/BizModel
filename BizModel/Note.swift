//
//  Note.swift
//  BizModel
//
//  Created by Kelvin Lau on 2016-10-13.
//  Copyright © 2016 Kelvin Lau. All rights reserved.
//

import RealmSwift

class Note: Object {
  dynamic var id = UUID().uuidString
  dynamic var contents = ""
  dynamic var category = 0
  
  convenience init(contents: String, category: Int) {
    self.init()
    self.contents = contents
    self.category = category
  }
  
  override class func primaryKey() -> String? {
    return "id"
  }
}
