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
    var showingBack = true
    
    var image: UIImage!
    var artist: Artist!
    
    init(image: UIImage , artist: Artist) {
        self.image = image
        self.artist = artist
    

        front = UIImageView(image: image)
        back = UIImageView(image: image)
        blur = UIVisualEffectView()
        back.addSubview(blur)
        
        
        let singleTap = UITapGestureRecognizer(target: self, action: Selector("tapped"))
        singleTap.numberOfTapsRequired = 1

        let rect = CGRectMake(0, 0, 0, 0)
        
        front.contentMode = .ScaleAspectFit
        front.image = image
        card = UIView(frame: rect)
        card.addGestureRecognizer(singleTap)
        card.userInteractionEnabled = true
        front.contentMode = .ScaleAspectFit
        card.addSubview(front)
        card.clipsToBounds = true
        
    }
    func tapped() {
        if (showingBack) {
            UIView.transitionFromView(back, toView: front, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromRight, completion: nil)
            showingBack = false
        } else {
            UIView.transitionFromView(front, toView: back, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromLeft, completion: nil)
            showingBack = true
        }
    }
}