//
//  RFTab.swift
//  RFTopTabBar
//
//  Created by Raffaele Forgione on 27/11/2019.
//  Copyright © 2019 RF. All rights reserved.
//

import UIKit

class RFTabView: UIView {
    private var icon: UIImageView?
    private var title: UILabel?
    
    var iconImg: UIImage? {
        didSet {
            icon?.image = iconImg
        }
    }
    
    var titleColor: UIColor? {
        didSet {
            title?.textColor = titleColor
        }
    }
    
    var titleFont: UIFont? {
       didSet {
            title?.font = titleFont
        }
    }
    
    var titleString: String? {
        didSet {
            title?.text = titleString
        }
    }
    
    private var noIcons = false
    
    override func layoutSubviews() {
        super.layoutSubviews()
        redrawViews()
    }
    
    init(frame: CGRect, noIcons: Bool) {
        super.init(frame: frame)
        self.noIcons = noIcons
        addViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        if title == nil && icon == nil {
            addViews()
        }
        else {
            redrawViews()
        }
    }
    
    private func addViews() {
        if noIcons {
            let titleHeight = frame.size.height
            addTitleView(titleHeight: titleHeight)
        }
        else {
            let titleHeight = frame.size.height / 4
            addTitleView(titleHeight: titleHeight)
            addIconView(iconSize: titleHeight)
        }
    }
    
    private func addTitleView(titleHeight: CGFloat) {
        title = UILabel(frame: CGRect(x: 2, y: frame.size.height - 2 - titleHeight, width: frame.size.width - 4, height: titleHeight))
        title?.textAlignment = .center
        addSubview(title!)
    }
    
    private func addIconView(iconSize: CGFloat) {
        icon = UIImageView(frame: CGRect(x: (frame.size.width - iconSize) / 2, y: title!.frame.origin.y - 2 - iconSize, width: iconSize, height: iconSize))
        icon?.image = iconImg
        addSubview(icon!)
    }
    
    private func redrawViews() {
        if noIcons{
            let titleHeight = frame.size.height
            title?.frame = CGRect(x: 2, y: frame.size.height - 2 - titleHeight, width: frame.size.width - 4, height: titleHeight)
        }
        else {
            let titleHeight = frame.size.height / 4
            title?.frame = CGRect(x: 2, y: frame.size.height - 2 - titleHeight, width: frame.size.width - 4, height: titleHeight)
            let iconSize = titleHeight
            icon?.frame = CGRect(x: (frame.size.width - iconSize) / 2, y: title!.frame.origin.y - 2 - iconSize, width: iconSize, height: iconSize)
        }
    }
    
}
