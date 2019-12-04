//
//  RFTabItem.swift
//  RFTopTabBar
//
//  Created by Raffaele Forgione on 28/11/2019.
//  Copyright © 2019 RF. All rights reserved.
//

import UIKit

class RFTabItem {
    private (set) var iconSelected: UIImage
    private (set) var iconUnselected: UIImage
    private (set) var title: String
    private (set) var vcID: String
    
    init(iconSelected: UIImage, iconUnselected: UIImage, title: String, vcID: String) {
        self.iconSelected = iconSelected
        self.iconUnselected = iconUnselected
        self.title = title
        self.vcID = vcID
    }
}
