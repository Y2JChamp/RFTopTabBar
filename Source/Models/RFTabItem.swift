//
//  RFTabItem.swift
//  RFTopTabBar
//
//  Created by Raffaele Forgione on 28/11/2019.
//  Copyright © 2019 RF. All rights reserved.
//

import UIKit

public class RFTabItem {
    private (set) var iconSelected: UIImage?
    private (set) var iconUnselected: UIImage?
    private (set) var title: String
    private (set) var vcID: String
    private (set) var font: UIFont
    
    public init(iconSelected: UIImage? = nil, iconUnselected: UIImage? = nil, title: String, vcID: String, font: UIFont = .systemFont(ofSize: 18)) {
        self.iconSelected = iconSelected
        self.iconUnselected = iconUnselected
        self.title = title
        self.vcID = vcID
        self.font = font
    }
}
