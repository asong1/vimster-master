//
//  BackendConfiguration.swift
//  Vimster
//
//  Created by Alex Song on 2/12/17.
//  Copyright © 2017 LexCorp. All rights reserved.
//

import Foundation

public final class BackendConfiguration {
    
    let baseUrl: URL

    public init(baseUrl: URL) {
        self.baseUrl = baseUrl
    }

    public static var shared: BackendConfiguration!
}
