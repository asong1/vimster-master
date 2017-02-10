//
//  LoginViewController.swift
//  Vimster
//
//  Created by Alex Song on 2/10/17.
//  Copyright © 2017 LexCorp. All rights reserved.
//

import Foundation

import UIKit
import SafariServices
import OAuthSwift

enum URLHandlerType {
    case `internal`
    case external
    case safari
}

class LoginViewController: UIViewController {
    
    var oauthswift: OAuthSwift?
    
    @IBOutlet weak var appTitleLabel: UILabel!
    @IBOutlet weak var appDescriptionLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupViews()
    }
    
    // MARK: - IBActions
    @IBAction func loginPressed(_ sender: Any) {
        self.login()
    }

    
    fileprivate func login() {
        if VimsterKeychain.shared.token == nil {
            self.oauthLogin()
        } else {
            print(VimsterKeychain.shared.token)
        }
    }
    
    fileprivate func setupViews() {
        appTitleLabel.text = VimsterConstants.Login.Strings.appTitle
        appDescriptionLabel.text = VimsterConstants.Login.Strings.appDescription
        loginButton.setTitle(VimsterConstants.Login.Strings.buttonTitle, for: .normal)
    }
}

extension LoginViewController {
    
    fileprivate func oauthLogin() {
        self.oauthswift = OAuth2.oauthswift
        OAuth2.oauthswift.authorizeURLHandler = SafariURLHandler(viewController: self, oauthSwift: OAuth2.oauthswift)
        let _ = OAuth2.handle
    }
    
}
