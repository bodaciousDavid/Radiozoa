//
//  Card.swift
//  Radiozoa
//
//  Created by David Daly on 6/18/15.
//  Copyright (c) 2015 David Daly. All rights reserved.
//

import Foundation
import UIKit

class CardView {    
    
    var cardView: UIView!
    var front: UIImageView!
    var back: UIImageView!
//    var blur: UIVisualEffectView
    
    var image: UIImage
    var artist: Artist
    
    init(image: UIImage , artist: Artist) {
        self.image = image
        self.artist = artist
    

        front = UIImageView(image: image)
        back = UIImageView(image: image)
        
        let singleTap = UITapGestureRecognizer(target: self, action: Selector("tapped"))
        singleTap.numberOfTapsRequired = 1

        let rect = CGRectMake(20, 20, back.image!.size.width, back.image!.size.height)
        cardView = UIView(frame: rect)
        cardView.addGestureRecognizer(singleTap)
        cardView.userInteractionEnabled = true
        cardView.addSubview(back)
        
    }
    
    func tapped() {
        println("tapped")
    }
    
}