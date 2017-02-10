//
//  Oauth2.swift
//  Vimster
//
//  Created by Alex Song on 2/10/17.
//  Copyright © 2017 LexCorp. All rights reserved.
//

import Foundation
import OAuthSwift

struct OAuth2 {
    static let oauthswift = OAuth2Swift(
        consumerKey:    "6a94ee7d633ced3573553649f5794db3cc00fa7a",
        consumerSecret: "f0Es44RZGOJYbGZRHXxoDrxBZPnYexqcgGaTzxnWySI8+xHZUPs88hQmewCCnJFzZWYVZ4Y2mli7dQZEQgWUkSibDgnaZ1MUwIIbn88bgctWTj7mSQDrWACy+g7v8Jqx",
        authorizeUrl:   "https://api.vimeo.com/oauth/authorize",
        accessTokenUrl: "https://api.vimeo.com/oauth/access_token",
        responseType:   "code"
    )
    static let handle = oauthswift.authorize(
        withCallbackURL: URL(string: VimsterConstants.Login.Strings.callbackUrl)!,
        scope: "", state: generateState(withLength: 20),
        success: { credential, response, parameters in
            print(credential.oauthToken)
    },
        failure: { error in
            print(error.localizedDescription)
    }
    )
}
