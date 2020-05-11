//
//  Entry.swift
//  CloudKitJournal
//
//  Created by Leonardo Diaz on 5/11/20.
//  Copyright © 2020 Zebadiah Watson. All rights reserved.
//

import Foundation
import CloudKit

//MARK: - Magic Strings struct

/**
 Creating a struct named EntryConstants containing the String values for keys used when setting the values for a CKRecord.
 */

struct EntryConstants {
    static let titleKey = "title"
    static let bodyKey = "body"
    static let timestampKey = "timestamp"
    static let recordType = "Entry"
}

<<<<<<< HEAD
//MARK: - Class Declaration

class Entry {
    
    let title: String
    let body: String
    let timeStamp: Date
    let ckRecordID: CKRecord.ID
    
    /**
     Initializes an Entry object
     
     - Parameters:
     - title: String value for the Entry objects title property
     - body: String value for the Entry objects body property
     - timeStamp: Date value for the Entry objects timeStamp property, given a default value of Date() (Date initialized)
     - ckRecordID: CKRecord.ID for the Entry object, set with a default vaule of UUID().uuidString
     */
    
    init(title: String, body: String, timeStamp: Date = Date(), ckRecordID: CKRecord.ID = CKRecord.ID(recordName: UUID().uuidString)) {
=======
class Entry{
    var title: String
    var body: String
    var ckRecordID: CKRecord.ID
    var timestamp: Date
    
    init(title: String, body: String, ckRecordID: CKRecord.ID = CKRecord.ID(recordName: UUID().uuidString), timestamp: Date = Date()) {
>>>>>>> starter
        self.title = title
        self.body = body
        self.ckRecordID = ckRecordID
        self.timestamp = timestamp
    }
<<<<<<< HEAD
} // End of Class

//MARK: - CKRecord Extension

extension CKRecord {
    
    /**
    Convenience Initializer to create a CKRecord from an Entry object
    
    - Parameters:
     - entry: The Entry object to set Key/Value pairs to store inside a CKRecord
    */
    
    convenience init(entry: Entry) {
        self.init(recordType: EntryConstants.recordTypeKey, recordID: entry.ckRecordID)
        self.setValuesForKeys([
            EntryConstants.titleKey : entry.title,
            EntryConstants.bodyKey : entry.body,
            EntryConstants.timeStampKey : entry.timeStamp
        ])
    }
}// End of Extension
=======
}
>>>>>>> starter

//MARK: - Extension for Convenience Initializer

extension Entry {
<<<<<<< HEAD
    
    /**
    Failable Convenience Initializer that initializes an Entry object stored in CloudKit
    
    - Parameters:
     - ckRecord: The CKRecord object containinf the Key/Value pairs of the Entry object stored in CloudKit
    */
    
    convenience init?(ckRecord: CKRecord) {
=======
    convenience init?(ckRecord: CKRecord){
>>>>>>> starter
        guard let title = ckRecord[EntryConstants.titleKey] as? String,
            let body = ckRecord[EntryConstants.bodyKey] as? String,
            let timestamp = ckRecord[EntryConstants.timestampKey] as? Date else { return nil }
        
        self.init(title: title, body: body, timestamp: timestamp)
    }
}


extension CKRecord {
    convenience init(entry: Entry) {
        
        self.init(recordType: EntryConstants.recordType, recordID: entry.ckRecordID)
        
        self.setValuesForKeys([
            EntryConstants.titleKey : entry.title,
            EntryConstants.bodyKey : entry.body,
            EntryConstants.timestampKey : entry.timestamp
        ])
    }
}
