//
//  VimeoVideoRequest.swift
//  Vimster
//
//  Created by Alex Song on 2/12/17.
//  Copyright © 2017 LexCorp. All rights reserved.
//

import Foundation

class VimeoVideoRequest: BackendAPIRequest {
    
    var category = ""
    
    var endpoint: String {
        return "categories/\(category)/videos"
    }
    
    var method: NetworkService.Method {
        return .get
    }

    var headers: [String: String]? {
        return ["Authorization" : "Bearer \(VimsterKeychain.shared.token!)"]
    }
    
    var parameters: Parameters? {
        return [
            "per_page": "3",
            "sort" : "plays",
            "direction" : "desc"
        ]
    }
}
