//
//  ItunesError.swift
//  iTunesClient
//
//  Created by Julia Friberg on 2017-05-23.
//  Copyright © 2017 Julia Friberg. All rights reserved.
//

import Foundation

enum ItunesError: Error {
    case requestFailed
    case responseUnsuccessful
    case invalidData
    case jsonConversionFailure
    case jsonParsingFailure(message: String)
}
