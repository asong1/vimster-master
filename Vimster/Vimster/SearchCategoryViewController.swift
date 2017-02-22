//
//  SearchCategoryViewController.swift
//  Vimster
//
//  Created by Alex Song on 2/12/17.
//  Copyright © 2017 LexCorp. All rights reserved.
//

import UIKit
import SVProgressHUD

final class SearchCategoryViewController: UIViewController {
    
    // MARK: - Fileprivate Vars

    fileprivate var service: VimeoVideoService?
    fileprivate var videos: [Video]?
    
    // MARK: - Internal Vars
    
    internal var selectedCategory: String?
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    
    // MARK: - View Lifecycle Methods
    
    override func viewWillAppear(_ animated: Bool) {
        self.setup()
    }
    
    // MARK: - View Setup
    
    fileprivate func setup() {
        self.title = VimsterConstants.Login.Strings.appTitle
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        service = VimeoVideoService()
        selectedCategory = VimsterConstants.SearchCategory.categories[0]
        descriptionLabel.text = VimsterConstants.SearchCategory.description
        submitButton.setTitle(VimsterConstants.SearchCategory.searchButtonTitle, for: .normal)
    }
    
    // MARK: - IBActions
    
    @IBAction func submitPressed(_ sender: Any) {
        SVProgressHUD.show()
        service?.videoInfo(forCategory: selectedCategory!, success: { (videos) in
            self.videos = videos
            SVProgressHUD.dismiss()
            self.performSegue(withIdentifier: "SearchResults", sender: self)
        }, failure: { (error) in
            print(error)
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SearchResults" {
            let destinationVC = segue.destination as! SearchResultsViewController
            destinationVC.videos = self.videos
        }
    }
    
}
