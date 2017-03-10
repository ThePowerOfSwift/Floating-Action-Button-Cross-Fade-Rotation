//
//  ArrayExtensions.swift
//  EMobileView
//
//  Created by Yung Dai on 2016-12-08.
//  Copyright © 2016 Yung Dai. All rights reserved.
//

import Foundation

    
extension Array {
    public init(count: Int, elementCreator: @autoclosure () -> Element) {
        self = (0 ..< count).map { _ in elementCreator() }
    }
}

