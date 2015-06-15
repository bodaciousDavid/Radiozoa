//
//  PeekPagedScrollViewController.swift
//  Radiozoa
//
//  Created by David Daly on 6/12/15.
//  Copyright (c) 2015 David Daly. All rights reserved.
//

import UIKit

class PeekPagedScrollViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var pageControl: UIPageControl!
    
    var pageImages: [UIImage] = []
    var pageViews: [UIImageView?] = []


    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        
        // 1
        pageImages = [UIImage(named: "Pic1")!,
            UIImage(named: "Pic2")!,
            UIImage(named: "Pic3")!,
            UIImage(named: "Pic4")!,
            UIImage(named: "Pic5")!]
        
        let pageCount = pageImages.count
        
        // 2
        pageControl.currentPage = 0
        pageControl.numberOfPages = pageCount
        
        // 3
        for _ in 0..<pageCount {
            pageViews.append(nil)
        }
        
        // 4
        let pagesScrollViewSize = scrollView.frame.size
        scrollView.contentSize = CGSize(width: pagesScrollViewSize.width * CGFloat(pageImages.count),
            height: pagesScrollViewSize.height)
       
        
        // 5
        //loadVisiblePages()
    }
//    func loadVisiblePages() {
//       
//        // First, determine which page is currently visible
//        let pageWidth = scrollView.frame.size.width
//        let page = Int(floor((scrollView.contentOffset.x * 2.0 + pageWidth) / (pageWidth * 2.0)))
//        
//        // Update the page control
//        pageControl.currentPage = page
//        
//        // Work out which pages you want to load
//        let firstPage = page - 1
//        let lastPage = page + 1
//        
//        // Purge anything before the first page
//        for var index = 0; index < firstPage; ++index {
//            purgePage(index)
//        }
//        
//        // Load pages in our range
//        for index in firstPage...lastPage {
//            loadPage(index)
//        }
//        
//        // Purge anything after the last page
//        for var index = lastPage+1; index < pageImages.count; ++index {
//            purgePage(index)
//        }
    
//    }
    
    func loadPage(page: Int) {
        
        if page < 0 || page >= pageImages.count {
            // If it's outside the range of what you have to display, then do nothing
            return
        }
        
        // Load an individual page, first checking if you've already loaded it
        if let pageView = pageViews[page] {
            // Do nothing. The view is already loaded.
        } else {
            var frame = scrollView.bounds
            frame.origin.x = frame.size.width * CGFloat(page)
            frame.origin.y = 0.0
            frame = CGRectInset(frame, 10.0, 0.0)
            
            let newPageView = UIImageView(image: pageImages[page])
            newPageView.contentMode = .ScaleAspectFit
            newPageView.frame = frame
            scrollView.addSubview(newPageView)
            pageViews[page] = newPageView
        }
         pageControl.transform = CGAffineTransformMakeRotation(3.14159/2)
    }
    
//    func purgePage(page: Int) {
//        if page < 0 || page >= pageImages.count {
//            // If it's outside the range of what you have to display, then do nothing
//            return
//        }
//        
//        // Remove a page from the scroll view and reset the container array
//        if let pageView = pageViews[page] {
//            pageView.removeFromSuperview()
//            pageViews[page] = nil
//        }
//    }
    
//    func scrollViewDidScroll(scrollView: UIScrollView) {
//        // Load the pages that are now on screen
//        //loadVisiblePages()
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
