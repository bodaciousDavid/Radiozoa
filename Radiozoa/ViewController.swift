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

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidLayoutSubviews() {
        let myImages = ["Pic1","Pic2","Pic3","Pic4","Pic5","Pic6","Pic7","Pic8","Pic9","Pic10","Pic11","Pic12","Pic13","Pic14","Pic15","Pic16","Pic17","Pic18","Pic19","Pic20","Pic21","Pic22","Pic23","Pic24","Pic25"]
        // defines bounds for images
        let imageWidth:CGFloat = scrollView.frame.size.width
        
        // vertical spacing of images. Images start at top of scroll view
        var yPostion: CGFloat = 0
        
        var scrollViewContentSize:CGFloat = 0
        // for all images in MyImage
        for var i=0; i<myImages.count; i++
        {
            
            // get the image from the list and put it in a box
            let myImage:UIImage = UIImage(named: myImages[i])!
            let myImageView:UIImageView = UIImageView()
            myImageView.image = myImage
              
            //Scales images height
            var imageScaleFactor = imageWidth/myImage.size.width
            var imageHeight:CGFloat = myImage.size.height * imageScaleFactor
            
            // impliments bounds for image
            var frame = scrollView.bounds
            frame.size.width = imageWidth
            frame.size.height = imageHeight
            frame.origin.x = 0
            frame.origin.y = yPostion
            frame = CGRectInset(frame, 0.0, 5.0)
            myImageView.contentMode = .ScaleAspectFit
            myImageView.frame = frame
            
            
            scrollView.addSubview(myImageView)
            
            // spaces image and alocates space 
            yPostion += imageHeight
            scrollViewContentSize += imageHeight
                
            scrollView.contentSize = CGSize(width: scrollView.frame.size.width,height: scrollViewContentSize)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
