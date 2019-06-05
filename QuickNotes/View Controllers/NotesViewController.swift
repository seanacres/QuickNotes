//
//  NotesViewController.swift
//  QuickNotes
//
//  Created by Sean Acres on 6/5/19.
//  Copyright © 2019 Sean Acres. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {
    // Mark: - Outlets and Properties
    @IBOutlet var tableView: UITableView!
    @IBOutlet var notesTextView: UITextView!
    
    let noteController = NoteController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // Mark: - IBActions and Methods
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let text = notesTextView.text else { return }
        
        noteController.createNote(withText: text)
        tableView.reloadData()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension NotesViewController: UITableViewDelegate {
    
}

extension NotesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteController.notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath) as? NoteTableViewCell else { return UITableViewCell() }
        
        let note = noteController.notes[indexPath.row]
        
        cell.note = note
        cell.delegate = self
        return cell
    }
}

extension NotesViewController: NoteTableViewCellDelegate {
    func shareNote(for cell: NoteTableViewCell) {
        guard let note = cell.note else { return }
        
        let text = note.text
        
        let activityController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        self.present(activityController, animated: true, completion: nil)
    }
}
