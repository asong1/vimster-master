//
//  SearchResultsViewController.swift
//  Vimster
//
//  Created by Alex Song on 2/13/17.
//  Copyright © 2017 LexCorp. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController {
    
    // MARK: - Internal Vars
    
    internal var videos: [Video]?
    
    // MARK: - IBOutlet

    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - View Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
    }

    // MARK: - Setup
    
    func setup() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
