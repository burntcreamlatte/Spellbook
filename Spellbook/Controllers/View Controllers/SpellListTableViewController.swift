//
//  SpellListTableViewController.swift
//  Spellbook
//
//  Created by Aaron Shackelford on 11/21/19.
//  Copyright © 2019 Aaron Shackelford. All rights reserved.
//

import UIKit

class SpellListTableViewController: UITableViewController {

    @IBOutlet weak var spellSearchBar: UISearchBar!
    
    var spells: [Spell] = [] {
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SpellsController.fetchSpells { result in
            switch result {
            case .success(let spells):
                self.spells = spells
            case .failure(let error):
                print("ERROR in \(#function) : \(error), \n---\n \(error.localizedDescription)")
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.spells.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "spellCell", for: indexPath) as? SpellListTableViewCell else { return UITableViewCell() }
        let spell = self.spells[indexPath.row]
        cell.spell = spell
        
        
        return cell
    }
    
}
//extension SpellListTableViewController: UISearchBarDelegate {
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        guard let searchNumber = searchBar.text, !searchNumber.isEmpty else { return }
//
//        SpellsController.fetchSpells(searchNumber: searchNumber) { (result) in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let spell):
//
//                case .failure(let error):
//                    print("ERROR in \(#function) : \(error), \n---\n \(error.localizedDescription)")
//                }
//            }
//        }
//    }
//}
