//
//  CALayerExtensions.swift
//  EMobileView
//
//  Created by Yung Dai on 2016-10-27.
//  Copyright © 2016 Yung Dai. All rights reserved.
//

import UIKit

extension  CALayer {
    
    func transformForFraction(_ fraction:CGFloat, view: UIView) -> CATransform3D {
        
        var identify = CATransform3DIdentity
        identify.m34 = -1.0 / 1000.0
        let angle = Double(1.0 - fraction) * -Double.pi / 2
        
        let xOffSet = view.bounds.width * 0.5
        let rotateTransform = CATransform3DRotate(identify, CGFloat(angle), 0.0, 1.0, 0.0)
        
        let translateTransform = CATransform3DMakeTranslation(xOffSet, 0.0, 0.0)
        return CATransform3DConcat(rotateTransform, translateTransform)
        
    }

}
