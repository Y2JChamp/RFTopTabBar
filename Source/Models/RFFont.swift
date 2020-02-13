//
//  RFFont.swift
//  RFTopTabBar
//
//  Created by Raffaele Forgione on 13/02/2020.
//  Copyright © 2020 RF. All rights reserved.
//

import UIKit

public class RFFont {
    var highlighted: UIFont
    var normal: UIFont
    
    public init(normal: UIFont, highlighted: UIFont) {
        self.highlighted = highlighted
        self.normal = normal
    }
}
