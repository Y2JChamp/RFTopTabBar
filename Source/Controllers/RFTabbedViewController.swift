//
//  ViewController.swift
//  RFTopTabBar
//
//  Created by Raffaele Forgione on 27/11/2019.
//  Copyright © 2019 RF. All rights reserved.
//

import UIKit

open class RFTabbedViewController: UIViewController, TabTapProtocol {

    private lazy var tabView: RFTopTabBarView = {
        return RFTopTabBarView()
    }()
    
    private lazy var containerView: UIView = {
        return UIView()
    }()
    
    private var presentedChildVC: UIViewController?
    private var vcsIDs = [String]()
    
    // DESIGNABLE
    @IBInspectable var tabBarHeight: CGFloat = 100
    @IBInspectable var tabTitleSelectedColor: UIColor = .blue
    @IBInspectable var tabTitleUnSelectedColor: UIColor = .blue
    @IBInspectable var tabUnderlineColor: UIColor = .blue
    @IBInspectable var tabUnderlineHeight: CGFloat = 2
    @IBInspectable var tabUnderlineBottom: CGFloat = 2
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        addSubViews()
        setupTabBar()
        setupContainer()
        view.layoutIfNeeded()
    }
    
    private func setupSubViews() {
        tabView.configure(with: subviewsModel())
    }
    
    private func subviewsModel() -> RFTabBarUI {
        return RFTabBarUI(tabTitleSelectedColor: tabTitleSelectedColor, tabTitleUnSelectedColor: tabTitleUnSelectedColor, tabUnderlineColor: tabUnderlineColor, tabUnderlineHeight: tabUnderlineHeight, tabUnderlineBottom: tabUnderlineBottom)
    }
    
    private func addSubViews() {
        view.addSubview(tabView)
        view.addSubview(containerView)
    }
    
    private func setupTabBar() {
        tabView.translatesAutoresizingMaskIntoConstraints = false
        let top = NSLayoutConstraint(item: tabView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)
        let left = NSLayoutConstraint(item: tabView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0)
        let right = NSLayoutConstraint(item: tabView, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0)
        let height = NSLayoutConstraint(item: tabView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: tabBarHeight)
        view.addConstraints([top, left, right, height])
    }
    
    private func setupContainer() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        let top = NSLayoutConstraint(item: tabView, attribute: .bottom, relatedBy: .equal, toItem: containerView, attribute: .top, multiplier: 1, constant: 0)
        let left = NSLayoutConstraint(item: containerView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0)
        let right = NSLayoutConstraint(item: containerView, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0)
        let bottom = NSLayoutConstraint(item: containerView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        view.addConstraints([top, left, right, bottom])
    }
    
    func add(tabsItems: [RFTabItem]) {
        guard tabsItems.count > 0 else {
            return
        }
        
        createTabView(with: tabsItems)
    }
    
    private func createTabView(with tabsItems: [RFTabItem]) {
        var imagesSelected = [UIImage]()
        var imagesUnselected = [UIImage]()
        var titles = [String]()
        var fonts = [UIFont]()
        
        for tab in tabsItems {
            if let selected = tab.iconSelected {
                imagesSelected.append(selected)
            }
            if let unselected = tab.iconUnselected {
                imagesUnselected.append(unselected)
            }
            titles.append(tab.title)
            vcsIDs.append(tab.vcID)
            fonts.append(tab.font)
        }
        
        add(imagesSelected: imagesSelected, imagesUnselected: imagesUnselected, titles: titles, fonts: fonts)
    }
    
    private func add(imagesSelected: [UIImage], imagesUnselected: [UIImage], titles: [String], fonts: [UIFont]) {
        tabView.add(iconsSelected: imagesSelected, iconsUnselected: imagesUnselected, titles: titles, fonts: fonts)
        setupSubViews()
        tabView.delegate = self
        showChildVC(withName: vcsIDs.first)
    }
    
    private func showChildVC(withName name: String?) {
        removeChildViewControllerIfPresent()
        if let vc = storyboard?.instantiateViewController(withIdentifier: name ?? "") {
            addChild(vc)
            vc.view.frame = view.frame
            containerView.frame = view.frame
            containerView.addSubview(vc.view)
            presentedChildVC = vc
        }
        else {
            print("Error initializing view controller")
        }
    }
    
    private func removeChildViewControllerIfPresent() {
        if let vc = presentedChildVC {
            vc.view.removeFromSuperview()
            vc.removeFromParent()
        }
    }
    
    internal func didTapTab(at Index: Int) {
        showChildVC(withName: vcsIDs[Index])
    }

}

