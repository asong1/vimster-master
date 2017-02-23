//
//  VideoCell.swift
//  Vimster
//
//  Created by Alex Song on 2/13/17.
//  Copyright © 2017 LexCorp. All rights reserved.
//

import UIKit

class VideoCell: UICollectionViewCell {

    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var webView: UIWebView!
    
    override func awakeFromNib() {
        setup()
    }
    
    fileprivate func setup() {
        webView.scalesPageToFit = true
        webView.contentMode = .scaleAspectFit
        webView.delegate = self
    }
    
}

extension VideoCell: UIWebViewDelegate {

    func webViewDidFinishLoad(_ webView: UIWebView) {
        if webView.isLoading == false {
            let contentSize:CGSize = webView.scrollView.contentSize
            let viewSize:CGSize = self.bounds.size
            
            let rw: CGFloat = viewSize.width / contentSize.width
            
            webView.scrollView.minimumZoomScale = rw
            webView.scrollView.maximumZoomScale = rw
            webView.scrollView.zoomScale = rw
        }
    }
    
}
