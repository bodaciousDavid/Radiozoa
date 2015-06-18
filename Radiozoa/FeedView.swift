//
//  FeedView.swift
//  Radiozoa
//
//  Created by David Daly on 6/18/15.
//  Copyright (c) 2015 David Daly. All rights reserved.
//

import Foundation
import UIKit

class FeedView { //UIScrollViewDelegate {
    
    var scrollView: UIScrollView!
    var pageImages: [UIImage]
    
    init(scrollView: UIScrollView, pageImages: [UIImage] ){
        self.scrollView = scrollView
        self.pageImages = pageImages
    
    var pageViews: [UIImageView?] = []
    
    let pageCount = pageImages.count
    
    // no images are loaded yet so all values are null
    for _ in 0..<pageCount {
    pageViews.append(nil)
    }
    
    // sets the height and width of scrollable area
    //this should be put into a scroll class
    let pagesScrollViewSize = scrollView.frame.size
    scrollView.contentSize = CGSize(width:pagesScrollViewSize.width,
    height: pagesScrollViewSize.height * CGFloat(pageImages.count) )
    
    
    self.loadVisiblePages()
    }
    
    
    
    func loadPage(page: Int) {
        if page < 0 || page >= pageImages.count {
            // If it's outside the range of what you have to display, then do nothing
            return
        }
        
        // loads images that are visable
        if let pageView = pageViews[page] {
            // Do nothing. The view is already loaded.
        } else {
            
            // This defines where each piece of art will be placed
            var frame = scrollView.bounds
            frame.origin.x = 0.0
            frame.origin.y = frame.size.height * CGFloat(page)
            
            // this will be replaced by card view
            let newPageView = UIImageView(image: pageImages[page])
            newPageView.contentMode = .ScaleAspectFit
            newPageView.frame = frame
            scrollView.addSubview(newPageView)
            
            // 4
            pageViews[page] = newPageView
        }
    }
    func purgePage(page: Int) {
        if page < 0 || page >= pageImages.count {
            // If it's outside the range of what you have to display, then do nothing
            return
        }
        
        // Remove a page from the scroll view and reset the container array
        if let pageView = pageViews[page] {
            pageView.removeFromSuperview()
            pageViews[page] = nil
        }
    }
    func loadVisiblePages() {
        // First, determine which page is currently visible
        let pageHeight = scrollView.frame.size.height
        
        let page = Int(floor((scrollView.contentOffset.y * 2.0 + pageHeight) / (pageHeight * 2.0)))
        
        // Work out which pages you want to load
        let firstPage = page - 1
        let lastPage = page + 1
        
        // Purge anything before the first page
        for var index = 0; index < firstPage; ++index {
            purgePage(index)
        }
        
        // Load pages in our range
        for index in firstPage...lastPage {
            loadPage(index)
        }
        
        // Purge anything after the last page
        for var index = lastPage+1; index < pageImages.count; ++index {
            purgePage(index)
        }
    }
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // Load the pages that are now on screen
        loadVisiblePages()
    }
}
