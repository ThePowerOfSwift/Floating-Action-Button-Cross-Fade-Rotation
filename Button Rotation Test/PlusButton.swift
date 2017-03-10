//
//  PlusButton.swift
//  Button Rotation Test
//
//  Created by Yung Dai on 2017-03-10.
//  Copyright © 2017 Yung Dai. All rights reserved.
//

import UIKit

class PlusButton: UIView {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.backgroundColor = UIColor.clear

        MobileAdsStyleKit.drawPlusSymbol(plusFrame: rect, colour: UIColor.white)
    }


}
