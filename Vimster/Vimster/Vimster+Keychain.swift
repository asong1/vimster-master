//
//  Vimster+Keychain.swift
//  Vimster
//
//  Created by Alex Song on 2/10/17.
//  Copyright © 2017 LexCorp. All rights reserved.
//

import Foundation

class VimsterKeychain: KeychainWrapper {
    
    static let shared = VimsterKeychain()
    
    func setAccessToken(token: String) {
        KeychainWrapper.createKeychainValue(token, forIdentifier: VimsterConstants.Login.KeychainConfiguration.userToken)
    }
    
    public var token: String? {
        return KeychainWrapper.keychainStringFrom(matchingIdentifier: VimsterConstants.Login.KeychainConfiguration.userToken)
    }
    
}
