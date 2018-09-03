//
//  ItunesError.swift
//  iTunesClient
//
//  Created by Radu Albastroiu on 03/09/2018.
//  Copyright © 2018 Radu Albastroiu. All rights reserved.
//

import Foundation

enum ItunesError: Error {
    case requestFailed
    case responseUnsuccessful
    case invalidData
    case jsonConversionFailure
    case jsonParsingFailure(message: String)
}
