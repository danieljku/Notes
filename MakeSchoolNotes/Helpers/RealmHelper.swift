//
//  RealmHelper.swift
//  MakeSchoolNotes
//
//  Created by Daniel Ku on 6/22/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import Foundation
import RealmSwift

class RealmHelper{
    static func addNote(note: Note){
        let realm = try! Realm()
        try! realm.write(){
            realm.add(note)
        }
    }
    
    static func deleteNote(note: Note){
        let realm = try! Realm()
        try! realm.write(){
            realm.delete(note)
        }
    }
    
    static func updateNote(originalNote: Note, newNote: Note){
        let realm = try! Realm()
        try! realm.write(){
            originalNote.title = newNote.title
            originalNote.content = newNote.content
            originalNote.modificationTime = newNote.modificationTime
         }
    }
    
    static func retrieveNote() -> Results<Note>{
        let realm = try! Realm()
        
        return realm.objects(Note).sorted("modificationTime", ascending: false)
    }
}