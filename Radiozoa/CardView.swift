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
    
    var card: UIView!
    var front: UIImageView!
    var back: UIImageView!
    var blur: UIVisualEffectView
    
    var image: UIImage!
    var artist: Artist!
    
    init(image: UIImage , artist: Artist) {
        self.image = image
        self.artist = artist
    

        front = UIImageView(image: image)
        back = UIImageView(image: image)
        blur = UIVisualEffectView()
        back.addSubview(blur)
        blur.frame = back.frame
        
        let singleTap = UITapGestureRecognizer(target: self, action: Selector("tapped"))
        singleTap.numberOfTapsRequired = 1

        let rect = CGRectMake(0, 0, 0, 0)
        card = UIView(frame: rect)
        card.addGestureRecognizer(singleTap)
        card.userInteractionEnabled = true
        card.addSubview(back)
        
    }
    func tapped() {
        println("tapped")
    }
    
}