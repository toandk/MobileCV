//
//  CategoryModel.swift
//  mobilecv
//
//  Created by Do Toan on 8/26/18.
//  Copyright © 2018 Do Toan. All rights reserved.
//

import UIKit
import ObjectMapper

class CategoryModel: Mappable {
    var name: String?
    var cover: String?
    var categoryId: String?
    var listResume: [ResumeModel]?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        name            <- map["name"]
        cover           <- map["cover"]
        categoryId      <- map["categoryId"]
//        listUser        <- map["users"]
    }
}
