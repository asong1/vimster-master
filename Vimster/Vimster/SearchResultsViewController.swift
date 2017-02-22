//
//  SearchResultsViewController.swift
//  Vimster
//
//  Created by Alex Song on 2/13/17.
//  Copyright © 2017 LexCorp. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController {
    
    internal var videos: [Video]?

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
    }

    func setup() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
