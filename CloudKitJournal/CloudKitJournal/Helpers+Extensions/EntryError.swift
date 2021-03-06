//
//  EntryError.swift
//  CloudKitJournal
//
//  Created by Leonardo Diaz on 5/11/20.
//  Copyright © 2020 Zebadiah Watson. All rights reserved.
//

import Foundation

    /**
    In this helper we are creating an enum to handle errors we get during our network calls
    */

enum EntryError: LocalizedError {
    case ckError(Error)
    case couldNotUnwrap

    var errorDescription: String {
        switch self {
        case .ckError(let error):
            return error.localizedDescription
        case .couldNotUnwrap:
        return "Unable to get this Hype.. which is not very hype..."
        }
    }
}
