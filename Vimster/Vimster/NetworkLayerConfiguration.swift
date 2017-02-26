//
//  NetworkLayerConfiguration.swift
//  Vimster
//
//  Created by Alex Song on 2/12/17.
//  Copyright © 2017 LexCorp. All rights reserved.
//

import Foundation

struct NetworkLayerConfiguration {

    func setup() {
        guard let url = URL(string: VimsterConstants.Network.baseUrl) else {
            return
        }
    
        BackendConfiguration.shared = BackendConfiguration(baseUrl: url)
        
        // Network Queue init
        NetworkQueue.shared = NetworkQueue()
    }

}
