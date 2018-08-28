//
//  NSObject+Helper.swift
//  mobilecv
//
//  Created by Do Toan on 8/26/18.
//  Copyright © 2018 Do Toan. All rights reserved.
//

import UIKit

extension NSObject {
    var className: String {
        return NSStringFromClass(type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}
