//
//  ProjectTableViewCell.swift
//  mobilecv
//
//  Created by Do Toan on 8/29/18.
//  Copyright © 2018 Do Toan. All rights reserved.
//

import UIKit

class ProjectTableViewCell: BaseTableViewCell {
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var openButton: UIButton!
    @IBOutlet weak var bgView: UIView!
    
    var project: ProjectModel!

    func setupCell(project: ProjectModel, index: Int) {
        self.project = project
        startDateLabel.text = project.startDate
        endDateLabel.text = project.endDate
        roleLabel.text = project.role
        descriptionLabel.text = project.projectDescription
        nameLabel.text = project.name
        openButton.isEnabled = false
        if let link = project.link, let url = URL(string: link) {
            if UIApplication.shared.canOpenURL(url) {
                openButton.isEnabled = true
            }
        }
        bgView.backgroundColor = UIColor.randomColor(index: 20 - index)
    }
    
    @IBAction func openAction() {
        if let link = project.link, let url = URL(string: link) {
            UIApplication.shared.openURL(url)
        }
    }
    
    static func getCellHeight(model: Any) -> CGFloat {
        if let project = model as? ProjectModel {
            let desc = project.projectDescription ?? ""
            let name = project.name ?? ""
            let winSize = UIScreen.main.bounds.size
            let descHeight = desc.height(withConstrainedWidth: winSize.width - 120, font: UIFont.systemFont(ofSize: 12))
            let nameHeight = name.height(withConstrainedWidth: winSize.width - 175, font: UIFont.boldSystemFont(ofSize: 15))
            return nameHeight + 10 + 20 + 20 + 20 + descHeight
        }
        return 100
    }
}
