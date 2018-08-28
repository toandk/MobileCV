//
//  UserModel.swift
//  mobilecv
//
//  Created by Do Toan on 8/27/18.
//  Copyright © 2018 Do Toan. All rights reserved.
//

import UIKit
import ObjectMapper

class ResumeModel: Mappable {
    var userId: String?
    var username: String?
    var categoryId: String?
    var categoryName: String?
    var avatar: String?
    var cover: String?
    var title: String?
    var summary: String?
    var address: String?
    var phone: String?
    var email: String?
    var birthday: String?
    var github: String?
    var website: String?
    var listCompany: [CompanyInfoModel]?
    
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        userId          <- map["userId"]
        username        <- map["username"]
        categoryId      <- map["categoryId"]
        categoryName    <- map["categoryName"]
        avatar          <- map["avatar"]
        cover           <- map["cover"]
        title           <- map["title"]
        summary         <- map["summary"]
        address         <- map["address"]
        phone           <- map["phone"]
        email           <- map["email"]
        birthday        <- map["birthday"]
        github          <- map["github"]
        website         <- map["website"]
        listCompany     <- map["companies"]
    }
}
