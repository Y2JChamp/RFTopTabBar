//
//  RFTopTabBar.swift
//  RFTopTabBar
//
//  Created by Raffaele Forgione on 27/11/2019.
//  Copyright © 2019 RF. All rights reserved.
//

import UIKit

protocol TabTapProtocol: class {
    func didTapTab(at Index: Int)
}

class RFTopTabBarView: UIView {
    
    private var tabs = [RFTabView]()
    private var iconsSelected = [UIImage]()
    private var iconsUnselected = [UIImage]()
    private var titles = [String]()
    private var model: RFTabBarUI!
    
    private var underlineView: UIView!
    
    weak var delegate: TabTapProtocol?
    
    final func add(iconsSelected: [UIImage] = [], iconsUnselected: [UIImage] = [], titles: [String]) {
        self.iconsSelected = iconsSelected
        self.iconsUnselected = iconsUnselected
        self.titles = titles
    }
    
    final func configure(with model: RFTabBarUI) {
        self.model = model
    }
    
    private func configureUnderlineView(with model: RFTabBarUI) {
        underlineView.backgroundColor = model.tabUnderlineColor
        underlineView.frame = CGRect(x: underlineView.frame.origin.x, y: underlineView.frame.origin.y, width: underlineView.frame.size.width, height: model.tabUnderlineHeight)
    }
    
    private func insertData() {
        var index = 0
        for tab in tabs {
            if index == 0 {
                tab.titleColor = model.tabTitleSelectedColor
                if iconsSelected.count > index {
                    tab.iconImg = iconsSelected[index]
                }
            }
            else {
                tab.titleColor = model.tabTitleUnSelectedColor
                if iconsUnselected.count > index {
                    tab.iconImg = iconsUnselected[index]
                }
            }
            tab.titleString = titles[index]
            index += 1
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    private func setupUI() {
        if tabs.count == 0 {
            insertTabs()
            insertData()
            insertUnderLine()
        }
        else {
            redrawTabs()
            redrawUnderLine()
        }
    }
    
    private func insertUnderLine() {
        if let width = tabs.first?.frame.size.width {
            underlineView = UIView(frame: CGRect(x: 5, y: frame.size.height - 2, width: width - 10, height: model.tabUnderlineHeight))
            underlineView.backgroundColor = .blue
            addSubview(underlineView)
            configureUnderlineView(with: model)
        }
    }
    
    private func redrawUnderLine() {
        if let tab = selectedTab(), let width = tabs.first?.frame.size.width {
            underlineView.frame = CGRect(x: tab.frame.origin.x + 5, y: underlineView.frame.origin.y, width: width, height: model.tabUnderlineHeight)
        }
    }
    
    private func selectedTab() -> RFTabView? {
        for tab in tabs where tab.titleColor! == model.tabTitleSelectedColor {
            return tab
        }
        return nil
    }
    
    private func moveUnderlineView(to tab: RFTabView) {
        unowned let uSelf = self
        UIView.animate(withDuration: 0.2) {
            uSelf.underlineView.frame = CGRect(x: tab.frame.origin.x + 5, y: uSelf.underlineView.frame.origin.y, width: uSelf.underlineView.frame.size.width, height: uSelf.model.tabUnderlineHeight)
        }
    }
    
    private func insertTabs() {
        let commonWidth = frame.width / CGFloat(titles.count)
        
        for index in 0..<titles.count {
            let tab = tabInit(width: commonWidth, index: index)
            let tap = UITapGestureRecognizer(target: self, action: #selector(handleTabTap(_:)))
            tab.addGestureRecognizer(tap)
            tab.noIcons = iconsSelected.count == 0
            //tab.backgroundColor = .gray
            addSubview(tab)
            tabs.append(tab)
        }
    }
    
    private func tabInit(width: CGFloat, index: Int) -> RFTabView {
        let x = width * CGFloat(index)
        let y: CGFloat = 0
        return RFTabView(frame: CGRect(x: x, y: y, width: width, height: frame.size.height))
    }
    
    private func redrawTabs() {
        let commonWidth = frame.width / CGFloat(tabs.count)
        var index = 0
        for tab in tabs {
            tab.frame = CGRect(x: CGFloat(index) * commonWidth, y: 0, width: commonWidth, height: frame.size.height)
            index += 1
        }
    }
    
    @objc func handleTabTap(_ sender: UITapGestureRecognizer) {
        if let tab = sender.view as? RFTabView, let index = tabs.firstIndex(of: tab), let d = delegate {
            tab.titleColor = model.tabTitleSelectedColor
            if iconsSelected.count > index {
                tab.iconImg = iconsSelected[index]
            }
            deselectAllTabs(except: tab)
            moveUnderlineView(to: tab)
            d.didTapTab(at: index)
        }
    }
    
    func deselectAllTabs(except tab: RFTabView) {
        var index = 0
        for t in tabs {
            if t != tab {
                t.titleColor = model.tabTitleUnSelectedColor
                if iconsUnselected.count > index {
                    t.iconImg = iconsUnselected[index]
                }
            }
            index += 1
        }
    }

}
