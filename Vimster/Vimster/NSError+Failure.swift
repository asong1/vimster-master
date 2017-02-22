//
//  NSError+Failure.swift
//  Vimster
//
//  Created by Alex Song on 2/12/17.
//  Copyright © 2017 LexCorp. All rights reserved.
//

import Foundation

extension NSError {
    class func cannotParseResponse() -> NSError {
        let info = [NSLocalizedDescriptionKey: "Can't parse response. Please report a bug.",
                    NSLocalizedFailureReasonErrorKey: "Can't parse response. Please report a bug."
        ]
        return NSError(domain: String(describing: self), code: 0, userInfo: info)
    }
}
