//
//  TabBarViewController.swift
//  TesteiOS2
//
//  Created by José Rafael Ferraz Pacheco on 29/12/19.
//  Copyright © 2019 José Rafael Ferraz Pacheco. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
    }

    private func setupTabBar() {
        let investmentNavController = UINavigationController(rootViewController: InvestmentViewController())
        investmentNavController.tabBarItem.title = "Investimento"

        let contactNavController = UINavigationController(rootViewController: ContactViewController())
        contactNavController.tabBarItem.title = "Contato"

        viewControllers = [investmentNavController, contactNavController]
    }

}
