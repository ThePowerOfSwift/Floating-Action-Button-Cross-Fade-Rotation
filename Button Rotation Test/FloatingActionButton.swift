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
        
        // setup the subviews so they center properly and are shaped properly
        setUpSubView(view: topView, with: .clear)
        setUpSubView(view: selectedView, with: .red)
        
        // add the subviews into the order that they should appear on the button
        self.addSubview(selectedView)
        self.addSubview(topView)
        
        selectedView.alpha = 0
    }
    
    func setUpSubView(view: UIView, with colour: UIColor) {
        
        view.bounds = bounds
        
        // make sure that the subview is also round
        view.fullRoundCorners(CFloat(bounds.width / 2), borderColour:
            .clear, borderWidth: 0)
        
        view.backgroundColor = colour
        
        // make sure that the CGPoint center of your subViews match the CGPoint of your current bounds midPoints
        // NOTE: You cannot say subView.center = self.center, this doesn't work without a conversion
        view.center = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // rounding corner extension that I use with other properties
        fullRoundCorners(CFloat(bounds.width / 2), borderColour:
            .clear, borderWidth: 0)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !tapped {
            
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut, animations: {
                
                self.rotateViewInsideAnimationBlock(rotations: 0.75, direction: .forward)

                
                self.topView.alpha = 0
                self.selectedView.alpha = 1
                
                 // Uncomment for scaling effect of the X
//                self.selectedView.transform = .identity
                

            }, completion: nil)

        
        } else {
            
            
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut, animations: {
                self.transform = .identity
                self.selectedView.alpha = 0
                self.topView.alpha = 1
                
                // Uncomment for scaling effect of the X
//                self.selectedView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)

            }, completion: nil)
        }
        
        tapped = !tapped
    }
    
}
