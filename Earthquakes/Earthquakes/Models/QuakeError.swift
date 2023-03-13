//
//  QuakeError.swift
//  Earthquakes
//
//  Created by 서찬호 on 2023/03/13.
//

import Foundation

enum QuakeError: Error {
    case missingData
    case networkError
    case unexpectedError(error: Error)
}

extension QuakeError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingData:
            return NSLocalizedString("Found and will discard a quake missing a vaild code, magnitude, palce, or time", comment: "")
        case .networkError:
            return NSLocalizedString("Error fetching quake data over the network", comment: "")
        case .unexpectedError(let error):
            return NSLocalizedString("Received unexpected error.\(error.localizedDescription)", comment: "")
        }
    }
}
