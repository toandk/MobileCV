//
//  UIColor+Utils.swift
//  mobilecv
//
//  Created by Do Toan on 8/30/18.
//  Copyright © 2018 Do Toan. All rights reserved.
//

import UIKit
import ChameleonFramework

extension UIColor {
    static func randomColor(index: NSInteger) -> UIColor {
        let colors = [UIColor.flatRed, UIColor.flatBlue, UIColor.flatLime, UIColor.flatTeal, UIColor.flatPlum, UIColor.flatSkyBlue, UIColor.flatCoffeeDark, UIColor.flatWatermelon, UIColor.flatOrange, UIColor.flatMaroon, UIColor.flatBlueDark, UIColor.flatMintDark]
        return colors[index % colors.count]
    }
}
