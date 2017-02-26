//
//  NetworkQueue.swift
//  Vimster
//
//  Created by Alex Song on 2/12/17.
//  Copyright © 2017 LexCorp. All rights reserved.
//

import Foundation

class NetworkQueue {

    public static var shared: NetworkQueue!
    
    let queue = OperationQueue()
    
    public init() {}
    
    public func addOperation(_ op: Operation) {
        queue.addOperation(op)
    }

}
