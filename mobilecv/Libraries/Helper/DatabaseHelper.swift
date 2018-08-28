//
//  DatabaseHelper.swift
//  NoteSwift
//
//  Created by ToanDK on 7/20/18.
//  Copyright © 2018 ToanDK. All rights reserved.
//

import Foundation
import RealmSwift
import FirebaseDatabase

class DatabaseHelper {
    static func migrateRealm() {
        var config = Realm.Configuration()
        
        // Use the default directory, but replace the filename with the username
        config.fileURL = config.fileURL!.deletingLastPathComponent().appendingPathComponent("mobilecv.realm")
        
        // Set this as the configuration used for the default Realm
        Realm.Configuration.defaultConfiguration = config
//        let databaseDirectoryPath = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: AppConstants.APP_GROUP_NAME)
//        let databasePath = databaseDirectoryPath?.appendingPathComponent("database.realm")
//        var config = Realm.Configuration(fileURL: databasePath)
//        config.schemaVersion = AppConstants.REALM_DB_VERSION
//        config.migrationBlock = { (oldRealm, newRealm) in
//
//        }
//        Realm.Configuration.defaultConfiguration = config
    }
    
    static func addDefaultCategories() {
        let databaseRef = Database.database().reference()
        databaseRef.child("categories")
            .childByAutoId()
            .setValue(["name": "iOS", "categoryId": "ios"])
        databaseRef.child("categories")
            .childByAutoId()
            .setValue(["name": "Android", "categoryId": "android"])
        databaseRef.child("categories")
            .childByAutoId()
            .setValue(["name": "Web", "categoryId": "web"])
        databaseRef.child("categories")
            .childByAutoId()
            .setValue(["name": "ReactNative", "categoryId": "rn"])
        databaseRef.child("categories")
            .childByAutoId()
            .setValue(["name": "ReactJs", "categoryId": "rjs"])
    }
    
    static func addDefaultResumes() {
        let databaseRef = Database.database().reference()
        
        let company1: [String: Any] = ["name": "ORT VN", "description": "This is a finance company", "logo": "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/06/06b15c3eeeb9330792781f161d326ecbe03f503a_full.jpg", "projects": [["name": "TKN", "role": "Tech leader", "description": "This is an original product", "link": "https://itunes.apple.com/us/app/id1088221406?mt=8"]]]
        let resume1: [String: Any] = ["username": "Nguyen Van A", "categoryId": "ios", "avatar": "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/00/0065c95f7b6cb31bee9dad39216712ff4a080b11_full.jpg", "cover": "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/06/06ada65ddf7e39a2749cae9124b08bea6304e930_full.jpg", "title": "iOS developer", "summary": "A little summary of ToanDK", "address": "Q7 HCM city", "phone": "+84999999991", "email": "dkt204@gmail.com", "birthday": "20/04/1988", "github": "https://github.com/toandk", "website": "https://apple.com", "companies": [company1]]
        
        let resume2: [String: Any] = ["username": "Pham Thi Dinh", "categoryId": "android", "avatar": "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/00/0065c5959765282187e8abd8f68ed444ed3e7f3b_full.jpg", "cover": "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/06/06ada65ddf7e39a2749cae9124b08bea6304e930_full.jpg", "title": "Android developer", "summary": "A little summary of ToanDK", "address": "Q7 HCM city", "phone": "+84999999991", "email": "dkt204@gmail.com", "birthday": "20/04/1988", "github": "https://github.com/toandk", "website": "https://apple.com", "companies": [company1]]
        
        databaseRef.child("resumes")
            .childByAutoId()
            .setValue(resume1)
        
        databaseRef.child("resumes")
            .childByAutoId()
            .setValue(resume2)
    }
}
