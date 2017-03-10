//
//  UIButtonExtentions.swift
//  EMobileView
//
//  Created by Yung Dai on 2016-10-14.
//  Copyright © 2016 Yung Dai. All rights reserved.
//

import UIKit


extension UIButton {

    func rotateButtonFourtyFiveDegrees(_ fraction: CGFloat) {
        
        let angle = Double(fraction) * Double.pi / 4
        self.transform = CGAffineTransform(rotationAngle: CGFloat(angle))
    }
    
    func rotateButtonNinetyDegrees(_ fraction: CGFloat) {
        
        let angle = Double(fraction) * Double.pi / 2
        self.transform = CGAffineTransform(rotationAngle: CGFloat(angle))
    }
}
