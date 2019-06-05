//
//  NoteController.swift
//  QuickNotes
//
//  Created by Sean Acres on 6/5/19.
//  Copyright © 2019 Sean Acres. All rights reserved.
//

import Foundation

class NoteController {
    private(set) var notes: [Note] = []
    
    func createNote(withText text: String) {
        let note = Note(text: text)
        notes.append(note)
    }
    
}
