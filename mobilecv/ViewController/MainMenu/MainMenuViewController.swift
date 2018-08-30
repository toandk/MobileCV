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
    
    func generateTabBarItem(title: String, image: String, selectedImage: String) -> RAMAnimatedTabBarItem {
        let item = RAMAnimatedTabBarItem(title: title, image: UIImage(named: image), selectedImage: UIImage(named: selectedImage))
        return item
    }
    
    func setupViewControllers() {
        let firstVC = HomeViewController(nibName: "HomeViewController", bundle: nil)
        firstVC.tabBarItem = generateTabBarItem(title: "Home", image: "navbar_icon_borrow_normal", selectedImage: "navbar_icon_borrow_pressed")
        let secondVC = HomeViewController(nibName: "HomeViewController", bundle: nil)
        secondVC.tabBarItem = generateTabBarItem(title: "New", image: "navbar_icon_loan_normal", selectedImage: "navbar_icon_loan_pressed")
        let thirdVC = HomeViewController(nibName: "HomeViewController", bundle: nil)
        thirdVC.tabBarItem = generateTabBarItem(title: "Me", image: "navbar_icon_me_normal", selectedImage: "navbar_icon_me_pressed")
        self.viewControllers = [firstVC, secondVC, thirdVC]
        
        (firstVC.tabBarItem as! RAMAnimatedTabBarItem).animation = RAMRotationAnimation()
        (secondVC.tabBarItem as! RAMAnimatedTabBarItem).animation = RAMRotationAnimation()
        (thirdVC.tabBarItem as! RAMAnimatedTabBarItem).animation = RAMBounceAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [weak self] in
            self?.setSelectIndex(from: 0, to: 0)
        }
    }
}
