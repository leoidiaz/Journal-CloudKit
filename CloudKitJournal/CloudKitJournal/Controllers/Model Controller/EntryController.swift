//
//  EntryController.swift
//  CloudKitJournal
//
//  Created by Leonardo Diaz on 5/11/20.
//  Copyright © 2020 Zebadiah Watson. All rights reserved.
//

import Foundation
import CloudKit

class EntryController {
    
    static let shared = EntryController()
    
    var entries: [Entry] = []
    
    let privateDB = CKContainer.default().privateCloudDatabase
    
    //MARK: - CRUD
    
    func createEntryWith(title: String, body: String, completion: @escaping (Result <Entry?, EntryError>) -> Void){
        let newEntry = Entry(title: title, body: body)
        saveEntry(entry: newEntry, completion: completion)
    }
    
    func saveEntry(entry:Entry, completion: @escaping (Result <Entry?, EntryError>) -> Void){
        let convertedRecord = CKRecord(entry: entry)
        privateDB.save(convertedRecord) { (record, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                return completion(.failure(.ckError(error)))
            }
            
            guard let record = record, let savedEntry = Entry(ckRecord: record) else {
                print("Could not unwrap")
                return completion(.failure(.couldNotUnwrap))
            }
            print("Mission Success")
            self.entries.append(savedEntry)
            completion(.success(savedEntry))
        }
    }
    
    func fetchEntries(completion: @escaping (Result <[Entry], EntryError>)->Void){
        let predicate = NSPredicate(value: true)
        let entryQuery = CKQuery(recordType: EntryConstants.recordType, predicate: predicate)
        privateDB.perform(entryQuery, inZoneWith: nil) { (records, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                return completion(.failure(.ckError(error)))
            }
            
            guard let records = records else { return completion(.failure(.couldNotUnwrap))}
            
            print("Fetched them entries boss")
            
            let entries = records.compactMap({Entry(ckRecord: $0)})
            self.entries = entries
            completion(.success(entries))
        }
    }
    
    func updateEntry(){
        
    }
    
    func deleteEntry(){
        
    }
    
    
}
