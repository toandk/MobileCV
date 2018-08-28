//
//  ProjectModel.swift
//  mobilecv
//
//  Created by Do Toan on 8/27/18.
//  Copyright © 2018 Do Toan. All rights reserved.
//

import UIKit
import ObjectMapper

class ProjectModel: Mappable {
    var name: String?
    var role: String?
    var projectDescription: String?
    var listPhoto: [String]?
    var link: String?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        name             <- map["name"]
        role                    <- map["role"]
        projectDescription      <- map["description"]
        listPhoto               <- map["photos"]
        link                    <- map["link"]
    }
}
