//
//  FloatingActionButton.swift
//  Button Rotation Test
//
//  Created by Yung Dai on 2017-03-10.
//  Copyright © 2017 Yung Dai. All rights reserved.
//

import UIKit

@IBDesignable class FloatingActionButton: UIView {
    
    var tapped: Bool = false
    
    // set the top and bottom as required programatic view
    var topView = MagnifyButton()
    var selectedView = PlusButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    func setup() {
        
        // make sure that the subviews are the same size as the button
        topView.bounds = bounds
        selectedView.bounds = bounds
        
        // make sure that your programatic button has a clear background
        topView.backgroundColor = .clear
        selectedView.backgroundColor = .clear
        
        
        // make sure that the CGPoint center of your subViews match the CGPoint of your current bounds midPoints
        // NOTE: You cannot say subView.center = self.center, this doesn't work without a conversion
        topView.center = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        selectedView.center = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        
        // add the subviews into the order that they should appear on the button
        self.addSubview(selectedView)
        self.addSubview(topView)
        
        selectedView.alpha = 0
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // rounding corner extension that I use with other properties
        fullRoundCorners(CFloat(bounds.width / 2), borderColour:
            .clear, borderWidth: 0)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !tapped {
            
            UIView.animate(withDuration: 0.3, animations: {
                self.rotateViewInsideAnimationBlock(rotations: 0.75, direction: .forward)
            
                self.topView.alpha = 0
                self.selectedView.alpha = 1
            })
        
        } else {
            
            UIView.animate(withDuration: 0.3, animations: {
                self.transform = .identity
                
                self.selectedView.alpha = 0
                self.topView.alpha = 1
            })
        }
        
        tapped = !tapped
    }
    
}
