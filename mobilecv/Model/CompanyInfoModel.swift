//
//  CompanyInfoModel.swift
//  mobilecv
//
//  Created by Do Toan on 8/27/18.
//  Copyright © 2018 Do Toan. All rights reserved.
//

import UIKit
import ObjectMapper

class CompanyInfoModel: Mappable {
    var name: String?
    var shortDescription: String?
    var logo: String?
    var listProject: [ProjectModel]?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        name                    <- map["name"]
        shortDescription        <- map["description"]
        logo                    <- map["logo"]
        listProject             <- map["projects"]
    }
}
