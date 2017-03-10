//
//  ViewExtensions.swift
//  EMobileView
//
//  Created by Yung Dai on 2016-10-05.
//  Copyright © 2016 Yung Dai. All rights reserved.
//

import UIKit

extension UIView {

    enum Direction {
        case forward, backwards
    }
    
    
    func slideSelectorToButtonPress(buttonTapped: UIButton) {
        
        UIView.animate(withDuration: 0.45,
                       delay: 0.0, usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.8,
                       options: .curveEaseInOut, animations: { [unowned self] in
                        self.center.x = buttonTapped.center.x
            })
        
    }
    
    
    // TODO: Finish this fade in on present function
    func presentFadeIn() {
        
    }
    
    func round(_ corners: UIRectCorner, radius: CGFloat) {
        roundCornersBy(corners, radius: radius)
    }
    
    func round(corners: UIRectCorner, radius: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
        let mask = roundCornersBy(corners, radius: radius)
        addBorder(mask, borderColour: borderColor, borderWidth: borderWidth)
    }
    
    func fullRoundCorners(_ diameter: CFloat, borderColour: UIColor, borderWidth: CGFloat) {
        
        layer.masksToBounds = true
        layer.cornerRadius = bounds.size.width / 2
        layer.borderWidth = borderWidth
        layer.borderColor = borderColour.cgColor;
        
    }
    

    func rotate360Degrees(duration: CFTimeInterval = 1.0, completionDelegate: AnyObject? = nil) {
        
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(Double.pi)
        rotateAnimation.duration = duration
        
        if let delegate: CAAnimationDelegate = completionDelegate as! CAAnimationDelegate? {
            rotateAnimation.delegate = delegate
        }
        
        self.layer.add(rotateAnimation, forKey: nil)
    }
    
    func rotateView(targetView: UIView, duration: Double = 1.0, direction: Direction, repeatCount: Float) {
        
        
        let fromValue = (direction == .forward) ? 0.0 : Float(Double.pi * 2)
        let toValue = (direction == .forward) ? Float(Double.pi * 2) : 0.0

        
        if self.layer.animation(forKey: "transform.rotation") == nil {
            
            let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
            
            rotationAnimation.fromValue = fromValue
            rotationAnimation.toValue = toValue
            rotationAnimation.duration = duration
            rotationAnimation.repeatCount = repeatCount
            
            self.layer.add(rotationAnimation, forKey: nil)
        }
    }
    
    
    // how to use 1.0 is one rotation 0.75 3/4 of a rotation
    // .forward rotates clockwise and .backwardfs rotates counter clockwise
    // use this if you don't have an animation block.
    func rotateViewWithDuration(_ duration:Double, rotations: CGFloat, direction: Direction) {
        
        
        UIView.animate(withDuration: duration) {
            
            let pi = (direction == .backwards) ? Double.pi : -Double.pi
            
            let angle: CGFloat = rotations * CGFloat(pi)
            self.transform = CGAffineTransform(rotationAngle: angle)
        }

        
    }
    
    
    // use this inside a animation block
    func rotateViewInsideAnimationBlock(rotations:CGFloat, direction: Direction) {
        
        let pi = (direction == .backwards) ? Double.pi : -Double.pi
        
        let angle: CGFloat = rotations * CGFloat(pi)
        self.transform = CGAffineTransform(rotationAngle: angle)
    }
}

private extension UIView {
    
    @discardableResult  func roundCornersBy(_ corners: UIRectCorner, radius: CGFloat) -> CAShapeLayer {
        
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        
        self.layer.mask = mask
        
        return mask
        
    }
    

    func addBorder(_ mask: CAShapeLayer, borderColour: UIColor, borderWidth: CGFloat) {
        
        let borderLayer = CAShapeLayer()
        borderLayer.path = mask.path
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.strokeColor = borderColour.cgColor
        borderLayer.lineWidth = borderWidth
        borderLayer.frame = bounds
        layer.addSublayer(borderLayer)
        
    }
}
