//
//  PendingOperations.swift
//  iTunesClient
//
//  Created by Radu Albastroiu on 03/09/2018.
//  Copyright © 2018 Radu Albastroiu. All rights reserved.
//

import Foundation

class PendingOperations {
    var downloadsInProgress = [IndexPath: Operation]()
    
    let downloadQueue = OperationQueue()
}
