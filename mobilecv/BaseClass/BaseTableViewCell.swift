//
//  BaseTableViewCell.swift
//  mobilecv
//
//  Created by Do Toan on 8/28/18.
//  Copyright © 2018 Do Toan. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    static func getNib() -> UINib {
        return UINib(nibName: self.className, bundle: nil)
    }

    static func getIdentifier() -> String {
        return self.className
    }
}
