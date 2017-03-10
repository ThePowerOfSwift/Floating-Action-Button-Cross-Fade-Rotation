//
//  BackgroundView.swift
//  BuddyUp
//
//  Created by Yung Dai on 2015-06-25.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

import UIKit

@IBDesignable class BackgroundView: UIView {
    
    let mobileAdStyleSkit = MobileAdsStyleKit()
    
    // MARK: Inspectable properties ******************************
    
    @IBInspectable var viewColour: UIColor = UIColor.gray {
        didSet {
            backgroundColor = viewColour
        }
    }
    
    @IBInspectable var useGradient: Bool = false {
        didSet {
            setupView()
        }
    }
    
    @IBInspectable var perfectCircleBorder: Bool = false {
        didSet{
            makeBorderCircle()
        }
    }
    
    @IBInspectable var startColor: UIColor = UIColor.red
    @IBInspectable var endColor: UIColor = UIColor.clear
    
    
    
    @IBInspectable var isHorizontal: Bool = false {
        didSet{
            setupView()
        }
    }
    

    @IBInspectable var cornerRounding: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRounding
            
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
            
        }
    }
    
    
    @IBInspectable var borderColour: UIColor? {
        didSet {
            layer.borderColor = borderColour?.cgColor
        }
    }
    
    

    
    
    // MARK: Overrides ******************************************

    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setupView()
    }
    
    override func awakeFromNib() {
        self.setNeedsDisplay()
        setupView()
    }
    


    
    // MARK: Internal functions for the gradient setup
    
    // Setup the view appearance
    private func setupView() {
        
        if (useGradient) {
            let colors:Array = [startColor.cgColor, endColor.cgColor]
            gradientLayer.colors = colors
            
            self.setNeedsDisplay()
        }
        
        
        if (isHorizontal){
            gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
            self.setNeedsDisplay()
        }else{
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
            self.setNeedsDisplay()
        }

    }
    
    
    // Helper to return the main layer as CAGradientLayer
    var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }
    

    
    @IBInspectable var hasShadow: Bool = false {
        didSet {
            setShadow()
        }
    }
    
    @IBInspectable var shadowColour: UIColor = UIColor.black
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 5, height: 5)
    @IBInspectable var shadowRadius: CGFloat = 5.0
    @IBInspectable var shadowOpacity: Float = 1.0

    private func setShadow() {

        if (hasShadow) {
            layer.shadowColor = shadowColour.cgColor
            layer.shadowOffset = shadowOffset
            layer.shadowRadius = shadowRadius
            layer.shadowOpacity = shadowOpacity
            layer.shouldRasterize = false
        }
        
        self.setNeedsDisplay()
    }
    
    private func makeBorderCircle() {
        
        if (perfectCircleBorder) {
            gradientLayer.cornerRadius = frame.size.width / 2
            layer.cornerRadius = frame.size.width / 2
        } else {
            gradientLayer.cornerRadius = cornerRounding
            layer.cornerRadius = cornerRounding
            setupView()
        }
        self.setNeedsDisplay()
    }
    

    // MARK: - Rounded Custom Corners
    
//    @IBInspectable var roundCorners: Bool = false {
//        didSet {
//            
//            roundCustomCorners()
//            
//        }
//    }
//    
//    @IBInspectable var roundUpperLeftCorner: Bool = false {
//        didSet {
//            
//            roundCustomCorners()
//            
//        }
//    }
//    
//    @IBInspectable var roundLowerLeftCorner: Bool = false {
//        didSet {
//            
//            roundCustomCorners()
//            
//        }
//    }
//    
//    @IBInspectable var roundUpperRightCorner: Bool = false {
//        didSet {
//            
//            roundCustomCorners()
//            
//        }
//    }
//    
//    
//    @IBInspectable var roundLowerRightCorner: Bool = false {
//        didSet {
//            
//            roundCustomCorners()
//            
//        }
//    }
//    
//
//    let upperLeftCorner: UIRectCorner = .topLeft
//    let lowerLeftCorner: UIRectCorner = .bottomLeft
//    let upperRightCorner: UIRectCorner = .topRight
//    let lowerRightCorner: UIRectCorner = .bottomRight
//    
//    private func roundCustomCorners() {
//        
//        var corners: UIRectCorner = UIRectCorner()
//        
//        if roundUpperLeftCorner {
//            corners = [upperLeftCorner]
//        }
//        
//        if roundLowerLeftCorner {
//            
//            corners = [lowerLeftCorner]
//        }
//        
//        if roundUpperRightCorner {
//            
//            corners = [upperRightCorner]
//        }
//        
//        if roundLowerRightCorner {
//            
//            corners = [lowerRightCorner]
//        }
//        
//        if  roundUpperLeftCorner && roundLowerLeftCorner {
//            
//            corners = [upperLeftCorner, lowerLeftCorner]
//        }
//        
//        if roundLowerLeftCorner && roundUpperRightCorner {
//            
//            corners = [lowerLeftCorner, upperRightCorner]
//        }
//        
//        if roundLowerLeftCorner && roundLowerRightCorner {
//            
//            corners = [lowerLeftCorner, lowerRightCorner]
//        }
//        
//        if roundLowerLeftCorner && roundUpperLeftCorner && roundLowerRightCorner {
//            
//            corners = [lowerLeftCorner, upperRightCorner, lowerRightCorner]
//        }
//        
//        if roundLowerLeftCorner && roundUpperLeftCorner && roundLowerRightCorner {
//            
//            corners = [lowerLeftCorner, upperRightCorner, lowerRightCorner]
//        }
//        
//
//        round(corners: corners, radius: cornerRounding, borderColor: borderColour!, borderWidth: borderWidth)
//    }
}
