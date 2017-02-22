//
//  ResponseMapper.swift
//  Vimster
//
//  Created by Alex Song on 2/12/17.
//  Copyright © 2017 LexCorp. All rights reserved.
//

import Foundation

internal enum ResponseMapperError: Error {
    case invalid
    case missingAttribute
}

public class ResponseMapper<A: ParsedItem> {
    
    static func process(_ obj: Any?, parse: (_ json: [String: Any]) -> A?) throws -> A {
        guard let json = obj as? [String: Any] else { throw ResponseMapperError.invalid }
        if let item = parse(json) {
            return item
        } else {
            throw ResponseMapperError.missingAttribute
        }
    }
}
