//
//  QueryItemProvider.swift
//  iTunesClient
//
//  Created by Julia Friberg on 2017-05-23.
//  Copyright © 2017 Julia Friberg. All rights reserved.
//

import Foundation

protocol QueryItemProvider {
    var queryItem: URLQueryItem { get }
}
