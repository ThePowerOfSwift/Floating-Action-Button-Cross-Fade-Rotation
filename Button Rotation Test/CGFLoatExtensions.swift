//
//  CGFLoatExtensions.swift
//  EMobileView
//
//  Created by Yung Dai on 2016-11-14.
//  Copyright © 2016 Yung Dai. All rights reserved.
//

import Foundation
import UIKit

extension CGFloat {
    
    static func getFractionFromVerticalScrollView(_ view: UIView, scrollView: UIScrollView) -> CGFloat {
    
        // set up the multiplier to allow for a fraction from 0 - 1 for different effects
        let multipler = 1.0 / view.bounds.width
        let offset = scrollView.contentOffset.y * multipler
        let fraction = 1.0 - offset
        
        return fraction
    }
    
    static func getFractionFromHorizontalScrollView(_ view: UIView, scrollView: UIScrollView) -> CGFloat {
        
        // set up the multiplier to allow for a fraction from 0 - 1 for different effects
        let multipler = 1.0 / view.bounds.width
        let offset = scrollView.contentOffset.x * multipler
        let fraction = 1.0 - offset
        
        return fraction
    }
    
}
