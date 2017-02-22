//
//  BackendAPIRequest.swift
//  Vimster
//
//  Created by Alex Song on 2/12/17.
//  Copyright © 2017 LexCorp. All rights reserved.
//

import Foundation

typealias Parameters = [String: Any]

protocol BackendAPIRequest {
    var endpoint: String { get }
    var method: NetworkService.Method { get }
    var headers: [String: String]? { get }
    var parameters: Parameters? { get }
}
