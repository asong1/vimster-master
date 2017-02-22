//
//  VideoResponseMapper.swift
//  Vimster
//
//  Created by Alex Song on 2/12/17.
//  Copyright © 2017 LexCorp. All rights reserved.
//

import Foundation

final class VideoResponseMapper: ResponseMapper<Video>, ResponseMapperProtocol {
    
    static func process(_ obj: Any?) throws -> Video {
        
        return try process(obj, parse: { json in
            let name = json["name"] as? String
            let videoUrl = json["link"] as? String
            let embed = json["embed"] as? [String: Any]
            if let embed = embed {
                let embedHTML = embed["html"] as? String
                if let name = name, let videoUrl = videoUrl {
                    return Video(name: name, videoUrl: videoUrl, embedHTML: embedHTML)
                }
            }
            return nil
        })
    }
}
