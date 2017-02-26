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


class LoginViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var appTitleLabel: UILabel!
    @IBOutlet weak var appDescriptionLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!

    
    //MARK: - View Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if VimsterKeychain.shared.token != nil {
            self.performSegue(withIdentifier: VimsterConstants.SearchCategory.segue, sender: self)
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func loginPressed(_ sender: Any) {
        self.oauthLogin()
    }
    
    fileprivate func setupViews() {
        appTitleLabel.text = VimsterConstants.Login.Strings.appTitle
        appDescriptionLabel.text = VimsterConstants.Login.Strings.appDescription
        loginButton.setTitle(VimsterConstants.Login.Strings.buttonTitle, for: .normal)
    }
}

extension LoginViewController {
    
    fileprivate func oauthLogin() {
        let handler = SafariURLHandler(viewController: self, oauthSwift: OAuth2.oauthswift)
        
        OAuth2.oauthswift.authorizeURLHandler = handler
        let _ = OAuth2.handle
    }
    
}
