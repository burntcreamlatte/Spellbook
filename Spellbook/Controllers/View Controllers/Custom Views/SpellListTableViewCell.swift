//
//  SpellListTableViewCell.swift
//  Spellbook
//
//  Created by Aaron Shackelford on 11/21/19.
//  Copyright © 2019 Aaron Shackelford. All rights reserved.
//

import UIKit

class SpellListTableViewCell: UITableViewCell {

    @IBOutlet weak var spellNameLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
    var spell: Spell? {
        didSet {
            updateViews()
        }
    }

    
    func updateViews() {
        self.spellNameLabel.text = spell?.name
        self.urlLabel.text = spell?.url
    }
}
