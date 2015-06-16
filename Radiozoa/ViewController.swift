//
//  ViewController.swift
//  Radiozoa
//
//  Created by David Daly on 6/12/15.
//  Copyright (c) 2015 David Daly. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var scrollView: UIScrollView!
    var pageImages: [UIImage] = []
    var pageViews: [UIImageView?] = []
    
    var cardView: UIView!
    var back: UIImageView!
    var front: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // array of images
        //this will be replaced with cardView objects
        pageImages = [
            UIImage(named: "Pic1")!,
            UIImage(named: "Pic2")!,
            UIImage(named: "Pic3")!,
            UIImage(named: "Pic4")!,
            UIImage(named: "Pic5")!//,
//            UIImage(named: "Pic6")!,
//            UIImage(named: "Pic7")!,
//            UIImage(named: "Pic8")!,
//            UIImage(named: "Pic9")!,
//            UIImage(named: "Pic10")!,
//            UIImage(named: "Pic11")!,
//            UIImage(named: "Pic12")!,
//            UIImage(named: "Pic13")!,
//            UIImage(named: "Pic14")!,
//            UIImage(named: "Pic15")!,
//            UIImage(named: "Pic16")!,
//            UIImage(named: "Pic17")!,
//            UIImage(named: "Pic18")!,
//            UIImage(named: "Pic19")!,
//            UIImage(named: "Pic20")!,
//            UIImage(named: "Pic21")!,
//            UIImage(named: "Pic22")!,
//            UIImage(named: "Pic23")!,
//            UIImage(named: "Pic24")!,
//            UIImage(named: "Pic25")!
        ]
        
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
        

        loadVisiblePages()
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
        let pageWidth = scrollView.frame.size.height
        //view.bounds.size.width//
        
        let page = Int(floor((scrollView.contentOffset.y * 20.0 + pageWidth) / (pageWidth * 2.0)))
        
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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

