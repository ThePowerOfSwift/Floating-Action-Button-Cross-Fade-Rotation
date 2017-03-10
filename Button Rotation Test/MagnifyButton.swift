//
//  MagnifyButton.swift
//  Button Rotation Test
//
//  Created by Yung Dai on 2017-03-10.
//  Copyright © 2017 Yung Dai. All rights reserved.
//

import UIKit

class MagnifyButton: UIView {
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.backgroundColor = UIColor.clear

        
        MobileAdsStyleKit.drawSearchMagnify(magnifyingGlassFrame: rect)
    }
    
    
}
