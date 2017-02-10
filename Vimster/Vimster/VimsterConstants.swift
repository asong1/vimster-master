//
//  VimsterConstants.swift
//  Vimster
//
//  Created by Alex Song on 2/10/17.
//  Copyright © 2017 LexCorp. All rights reserved.
//

import Foundation

struct VimsterConstants {

    struct Login {
        
        struct Strings {
            static let callbackUrl = "vimster://oauth-callback"
            static let appTitle = "Vimster"
            static let appDescription = "Make API calls to Vimeo!"
            static let buttonTitle = "Login"
        }
        
        struct KeychainConfiguration {
            static let userToken = "GhostDustersService.oauth.login"
        }
        
    }

}
