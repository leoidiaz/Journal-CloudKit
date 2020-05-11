//
//  EntryListTableViewController.swift
//  CloudKitJournal
//
//  Created by Leonardo Diaz on 5/11/20.
//  Copyright © 2020 Zebadiah Watson. All rights reserved.
//

import UIKit

class EntryListTableViewController: UITableViewController {
    //MARK: - Properties
    private let reuseIdentifier = "entryCell"
    private let segueEdit = "toEditSegue"
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        EntryController.shared.fetchEntries { (results) in
            switch results{
            case .success(_):
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.errorDescription)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntryController.shared.entries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        let entry = EntryController.shared.entries[indexPath.row]
        cell.textLabel?.text = entry.title
        cell.detailTextLabel?.text = entry.timestamp.format()
        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueEdit {
            guard let indexPath = tableView.indexPathForSelectedRow, let destinationVC = segue.destination as? EntryDetailViewController else { return }
            let entry = EntryController.shared.entries[indexPath.row]
            destinationVC.entry = entry
        }
    }

}
