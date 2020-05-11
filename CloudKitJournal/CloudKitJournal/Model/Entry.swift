//
//  Entry.swift
//  CloudKitJournal
//
//  Created by Leonardo Diaz on 5/11/20.
//  Copyright © 2020 Zebadiah Watson. All rights reserved.
//

import Foundation
import CloudKit

struct EntryConstants {
    static let titleKey = "title"
    static let bodyKey = "body"
    static let timestampKey = "timestamp"
    static let recordType = "Entry"
}

class Entry{
    var title: String
    var body: String
    var ckRecordID: CKRecord.ID
    var timestamp: Date
    
    init(title: String, body: String, ckRecordID: CKRecord.ID = CKRecord.ID(recordName: UUID().uuidString), timestamp: Date = Date()) {
        self.title = title
        self.body = body
        self.ckRecordID = ckRecordID
        self.timestamp = timestamp
    }
}

extension Entry {
    convenience init?(ckRecord: CKRecord){
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
