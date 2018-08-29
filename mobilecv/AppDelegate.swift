//
//  AppDelegate.swift
//  mobilecv
//
//  Created by Do Toan on 8/24/18.
//  Copyright © 2018 Do Toan. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        DatabaseHelper.migrateRealm()
//        setupFabric()
        setupFirebase()
        setupLibraries()
        setupViewController()
        
//        DatabaseHelper.addDefaultCategories()
//        DatabaseHelper.addDefaultResumes()
        
        return true
    }
    
    func setupViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let firstVC = MainMenuViewController()
        let navc = UINavigationController(rootViewController: firstVC)
        
        self.window?.rootViewController = navc
        navc.navigationBar.isTranslucent = false
        
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
    }
    
    func setupFabric() {
        Fabric.with([Crashlytics.self])
    }

    func setupFirebase() {
        FirebaseApp.configure()
    }
    
    func setupLibraries() {
        var config = GlidingConfig.shared
        config.cardsSize = CGSize(width: 260, height: 140)
        GlidingConfig.shared = config
    }
}

