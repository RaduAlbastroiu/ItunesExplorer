//
//  QuerryItemProvider.swift
//  iTunesClient
//
//  Created by Radu Albastroiu on 02/09/2018.
//  Copyright © 2018 Radu Albastroiu. All rights reserved.
//

import Foundation

protocol QueryItemProvider {
    var queryItem: URLQueryItem { get }
}
