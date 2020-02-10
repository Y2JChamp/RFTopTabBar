//
//  RFTabBarUI.swift
//  RFTopTabBar
//
//  Created by Raffaele Forgione on 01/12/2019.
//  Copyright © 2019 RF. All rights reserved.
//

import UIKit

class RFTabBarUI {
    private (set) var tabTitleSelectedColor: UIColor
    private (set) var tabTitleUnSelectedColor: UIColor
    private (set) var tabUnderlineColor: UIColor
    private (set) var tabUnderlineHeight: CGFloat
    
    init(tabTitleSelectedColor: UIColor, tabTitleUnSelectedColor: UIColor, tabUnderlineColor: UIColor, tabUnderlineHeight: CGFloat) {
        self.tabTitleSelectedColor = tabTitleSelectedColor
        self.tabTitleUnSelectedColor = tabTitleUnSelectedColor
        self.tabUnderlineColor = tabUnderlineColor
        self.tabUnderlineHeight = tabUnderlineHeight
    }
}
