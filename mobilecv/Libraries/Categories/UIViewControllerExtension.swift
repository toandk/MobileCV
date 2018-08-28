//
//  UIViewControllerExtension.swift
//  mobilecv
//
//  Created by Do Toan on 8/28/18.
//  Copyright © 2018 Do Toan. All rights reserved.
//

import UIKit

extension UIViewController {
    
    var window: UIWindow? {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.window
    }
    
    var rootViewController: UIViewController? {
        return self.window?.rootViewController
    }
    
    func push(viewController: UIViewController, animated: Bool) {
        (rootViewController as? UINavigationController)?.pushViewController(viewController, animated: true)
    }
}
