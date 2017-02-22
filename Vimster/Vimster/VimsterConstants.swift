//
//  VimsterConstants.swift
//  Vimster
//
//  Created by Alex Song on 2/10/17.
//  Copyright © 2017 LexCorp. All rights reserved.
//

import Foundation

struct VimsterConstants {
    
    struct Network {
        static let baseUrl = "https://api.vimeo.com/"
    }

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
    
    struct SearchCategory {
        static let segue = "SearchCategory"
        static let description = "Get the top 10 videos for a category"
        static let searchButtonTitle = "Get Top 10"
        static let categories = [
            "Animation",
            "Art",
            "CameraTechniques",
            "Comedy",
            "Documentary",
            "Experimental",
            "Fashion",
            "Food",
            "Instructionals",
            "Music",
            "Narrative",
            "Personal",
            "Journalism",
            "Sports",
            "Talks",
            "Travel"
        ]
        static let numberOfSections = 1
        static let numberOfItems = 1
    }

}
