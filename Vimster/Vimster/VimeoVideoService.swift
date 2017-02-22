
//
//  VimeoVideoService.swift
//  Vimster
//
//  Created by Alex Song on 2/12/17.
//  Copyright © 2017 LexCorp. All rights reserved.
//

import Foundation

final class VimeoVideoService {

    func videoInfo(forCategory category: String, success: (([Video]) -> Void)? = nil, failure: ((String) -> Void)? = nil) {
        let operation = VimeoVideoOperation(category: category)
        operation.success = { user in
            success?(user)
        }
        
        operation.failure = { error in
            let er = error as NSError
            if let failureDescription = er.userInfo[NSLocalizedFailureReasonErrorKey] as? String {
                failure?(failureDescription)
            } else {
                failure?(error as! String)
            }
        }
        
        NetworkQueue.shared.addOperation(operation)
    }
    
}
