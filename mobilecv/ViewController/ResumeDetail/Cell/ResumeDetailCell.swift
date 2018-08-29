//
//  ResumeDetailCell.swift
//  mobilecv
//
//  Created by Do Toan on 8/28/18.
//  Copyright © 2018 Do Toan. All rights reserved.
//

import UIKit
import ChameleonFramework

class ResumeDetailCell: BaseTableViewCell {
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var roleLabel1: UILabel!
    @IBOutlet weak var roleLabel2: UILabel!
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var companyLogo: UIImageView!
    @IBOutlet weak var leftView: UIView!
    
    func setupCell(company: CompanyInfoModel, index: Int) {
        companyNameLabel.text = company.name
        roleLabel1.text = company.role
        roleLabel2.text = company.role
        indexLabel.text = "#\(index)"
        startDateLabel.text = company.startDate
        endDateLabel.text = company.endDate
        leftView.backgroundColor = UIColor.randomFlat
    }
}
