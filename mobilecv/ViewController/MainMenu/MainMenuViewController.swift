//
//  MainMenuViewController.swift
//  mobilecv
//
//  Created by Do Toan on 8/24/18.
//  Copyright © 2018 Do Toan. All rights reserved.
//

import UIKit
import RAMAnimatedTabBarController

class MainMenuViewController: RAMAnimatedTabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }
    
    func setupViewControllers() {
        let firstVC = HomeViewController(nibName: "HomeViewController", bundle: nil)
        firstVC.tabBarItem = RAMAnimatedTabBarItem(title: "Home", image: UIImage(named: "navbar_icon_borrow_normal"), selectedImage: UIImage(named: "navbar_icon_borrow_pressed"))
        let secondVC = HomeViewController(nibName: "HomeViewController", bundle: nil)
        secondVC.tabBarItem = RAMAnimatedTabBarItem(title: "New", image: UIImage(named: "navbar_icon_loan_normal"), selectedImage: UIImage(named: "navbar_icon_loan_pressed"))
        let thirdVC = HomeViewController(nibName: "HomeViewController", bundle: nil)
        thirdVC.tabBarItem = RAMAnimatedTabBarItem(title: "Me", image: UIImage(named: "navbar_icon_me_normal"), selectedImage: UIImage(named: "navbar_icon_me_pressed"))
        self.viewControllers = [firstVC, secondVC, thirdVC]
        self.selectedIndex = 0
        (firstVC.tabBarItem as! RAMAnimatedTabBarItem).animation = RAMRotationAnimation()
        (secondVC.tabBarItem as! RAMAnimatedTabBarItem).animation = RAMRotationAnimation()
        (thirdVC.tabBarItem as! RAMAnimatedTabBarItem).animation = RAMBounceAnimation()
    }
}
