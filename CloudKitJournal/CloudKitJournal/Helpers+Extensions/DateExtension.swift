//
//  DateExtension.swift
//  CloudKitJournal
//
//  Created by Leonardo Diaz on 5/11/20.
//  Copyright © 2020 Zebadiah Watson. All rights reserved.
//

import Foundation
extension Date {
<<<<<<< HEAD
    
    /**
    Formats a date into a string using dateStyle.short and timeStyle.short
    */
    
    func formatDate() -> String {
=======
    func format() -> String{
>>>>>>> starter
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: self)
    }
}
