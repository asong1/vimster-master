//
//  ServiceOperation.swift
//  Vimster
//
//  Created by Alex Song on 2/12/17.
//  Copyright © 2017 LexCorp. All rights reserved.
//

import Foundation

class ServiceOperation: NetworkOperation {

    let service: BackendService
    
    public override init() {
        self.service = BackendService(BackendConfiguration.shared)
        super.init()
    }
    
    public override func cancel() {
        service.cancel()
        super.cancel()
    }

}
