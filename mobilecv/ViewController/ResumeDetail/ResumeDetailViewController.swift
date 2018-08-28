//
//  ResumeDetailViewController.swift
//  mobilecv
//
//  Created by Do Toan on 8/28/18.
//  Copyright © 2018 Do Toan. All rights reserved.
//

import Foundation
import UIKit
import Hero

class ResumeDetailViewController: BaseViewController {
    
    var viewModel: ResumeDetailViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var headerView: UIView!
    @IBOutlet weak var avatarView: UIImageView!
    @IBOutlet weak var coverView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        tableView.tableHeaderView = headerView
        if let resume = viewModel.resume {
            nameLabel.text = resume.username
            avatarView.kf.setImage(with: URL(string: viewModel.resume.avatar ?? ""))
            coverView.kf.setImage(with: URL(string: viewModel.resume.cover ?? ""))
            
            coverView.hero.id = "cover\(resume.userId!)"
            avatarView.hero.id = "avatar\(resume.userId!)"
            nameLabel.hero.id = "name\(resume.userId!)"
        }
    }
    
    @IBAction func backViewAction() {
        self.hero.dismissViewController()
    }
}
