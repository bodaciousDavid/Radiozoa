
//
//  CardDB.swift
//  Radiozoa
//
//  Created by David Daly on 6/19/15.
//  Copyright (c) 2015 David Daly. All rights reserved.
//

import Foundation
import UIKit

class CardDB {
    var array: [UIView] = []
    
    init() {
        var john = Artist(name: "john", contact: "fb.com/john")
        var card1 = CardView(image: UIImage(named: "Pic1")!, artist: john)
        var card2 = CardView(image: UIImage(named: "Pic2")!, artist: john)
        var card3 = CardView(image: UIImage(named: "Pic3")!, artist: john)
        var card4 = CardView(image: UIImage(named: "Pic4")!, artist: john)
        var card5 = CardView(image: UIImage(named: "Pic5")!, artist: john)
        array = [card1.card,
            card2.card,
            card3.card,
            card4.card,
            card5.card,]
    }
    func count() -> Int {
        return array.count
    }
}