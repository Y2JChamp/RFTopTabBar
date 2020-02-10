//
//  ExampleViewController.swift
//  RFTopTabBar
//
//  Created by Raffaele Forgione on 28/11/2019.
//  Copyright © 2019 RF. All rights reserved.
//

import UIKit

class ExampleViewController: RFTabbedViewController {

    override func viewDidLoad() {

        // Configuration
        let tab1 = RFTabItem(title: "Prova1", vcID: "Prova1", font: .italicSystemFont(ofSize: 15))
        let tab2 = RFTabItem(title: "Prova2", vcID: "Prova2", font: .systemFont(ofSize: 12))
        let tab3 = RFTabItem(title: "Prova3", vcID: "Prova3", font: .boldSystemFont(ofSize: 20))
//        let tab1 = RFTabItem(title: "Prova1", vcID: "Prova1")
//        let tab2 = RFTabItem(title: "Prova2", vcID: "Prova2")
//        let tab3 = RFTabItem(title: "Prova3", vcID: "Prova3")
        let tabs = [tab1, tab2, tab3, tab2]
        add(tabsItems: tabs)
        super.viewDidLoad()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
