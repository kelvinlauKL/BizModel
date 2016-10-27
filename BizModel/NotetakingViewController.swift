//
//  NotetakingViewController.swift
//  BizModel
//
//  Created by Kelvin Lau on 2016-10-13.
//  Copyright © 2016 Kelvin Lau. All rights reserved.
//

import UIKit
import RealmSwift

class NotetakingViewController: UIViewController {
  fileprivate var tableView: UITableView! { didSet {
    tableView.dataSource = self
    tableView.delegate = self
    tableView.estimatedRowHeight = 30
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.separatorStyle = .none
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
  }}
  
  var notes: Results<Note>!
  
  var category: Category!
  var subscription: NotificationToken?
  
}

// MARK: - Life Cycle
extension NotetakingViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let navigationController = navigationController {
      let leftBarButton = UIBarButtonItem(title: "   ", style: .plain, target: navigationController.view, action: #selector(navigationController.view.fade))
      navigationItem.leftBarButtonItems = [leftBarButton]
      
      let rightBarButton = UIBarButtonItem(title: "   ", style: .plain, target: self, action: #selector(addNote))
      navigationItem.rightBarButtonItems = [rightBarButton]
    }
    

  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    let tableView = UITableView(frame: view.bounds, style: .plain)
    
    self.tableView = tableView
    view.addSubview(tableView)
    
    subscription = notes.addNotificationBlock { [weak self] changes in
      self?.updateUI(withChanges: changes)
    }
  }
}

// MARK: - UITableViewDataSource
extension NotetakingViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    cell.textLabel?.numberOfLines = 0
    cell.textLabel?.text = "- " + notes[indexPath.row].contents
    cell.selectionStyle = .none
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return notes.count
  }

  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return true
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      try! notes.realm!.write {
        let note = self.notes[indexPath.row]
        self.notes.realm!.delete(note)
      }
    }
  }
}

// MARK: - UITableViewDelegate
extension NotetakingViewController: UITableViewDelegate {

}

// MARK: - Helper Methods
extension NotetakingViewController {
  func updateUI(withChanges changes: RealmCollectionChange<Results<Note>>) {
    switch changes {
    case .initial(_):
      tableView.reloadData()
    case let .update(_, deletions, insertions, _):
      tableView.beginUpdates()
      tableView.insertRows(at: insertions.map { IndexPath(row: $0, section: 0) }, with: .automatic)
      tableView.deleteRows(at: deletions.map { IndexPath(row: $0, section: 0) }, with: .automatic)
      tableView.endUpdates()
    case .error(let error):
      print(error)
    }
  }
  
  func addNote() {
    let alertController = UIAlertController(title: "Enter Note", message: nil, preferredStyle: .alert)
    let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
      // save the text here
      let textField = alertController.textFields!.first!
      let note = Note(contents: textField.text!, category: self.category.rawValue)

      
      let realm = try! Realm()
      try! realm.write {
        realm.add(note)
      }
    }
    
    let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
    
    alertController.addTextField { field in
      field.placeholder = "Note here"
    }
    
    alertController.addAction(saveAction)
    alertController.addAction(cancelAction)
    
    present(alertController, animated: true, completion: nil)
  }
}
