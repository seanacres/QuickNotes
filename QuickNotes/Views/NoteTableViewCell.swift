//
//  NoteTableViewCell.swift
//  QuickNotes
//
//  Created by Sean Acres on 6/5/19.
//  Copyright © 2019 Sean Acres. All rights reserved.
//

import UIKit


// Steps for delegate
// 1. create a protocol
// 2. create a weak var delegate of protocol type
// 3. call delegate method in IBAction
// 4. Assign the delegate

protocol NoteTableViewCellDelegate: class {
    func shareNote(for cell: NoteTableViewCell)
}

class NoteTableViewCell: UITableViewCell {
    
    // Mark: - Properties and outlets
    @IBOutlet var noteLabel: UILabel!
    weak var delegate: NoteTableViewCellDelegate?
    
    var note: Note? {
        didSet {
            updateViews()
        }
    }

    // Mark: - IBActions
    @IBAction func shareButtonTapped(_ sender: Any) {
        self.delegate?.shareNote(for: self)
    }
    
    private func updateViews() {
        guard let note = note else { return }
        noteLabel.text = note.text
    }
}
