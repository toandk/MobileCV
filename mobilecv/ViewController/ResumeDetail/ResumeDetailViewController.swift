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
import RxSwift
import RxCocoa

class ResumeDetailViewController: BaseViewController {
    
    var viewModel: ResumeDetailViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var headerView: UIView!
    @IBOutlet weak var avatarView: UIImageView!
    @IBOutlet weak var coverView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bindViewModel()
    }
    
    func setupView() {
        tableView.tableHeaderView = headerView
        if let resume = viewModel.resume {
            nameLabel.text = resume.username
            avatarView.kf.setImage(with: URL(string: viewModel.resume.avatar ?? ""))
            coverView.kf.setImage(with: URL(string: viewModel.resume.cover ?? ""))
            UIView.recursiveSetHeroId(view: headerView, identifier: resume.userId ?? "")
        }
    }
    
    func bindViewModel() {
        tableView.rowHeight = 184
        tableView.estimatedRowHeight = 184
        tableView.register(ResumeDetailCell.getNib(), forCellReuseIdentifier: ResumeDetailCell.getIdentifier())
        viewModel.listCompany.asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: ResumeDetailCell.getIdentifier(), cellType: ResumeDetailCell.self)) { row, element, cell in
                cell.setupCell(company: element, index: row + 1)
                cell.hero.modifiers = [.fade, .scale(0.5)]
            }
            .disposed(by: disposeBag)
    }
    
    @IBAction func backViewAction() {
        self.hero.dismissViewController()
    }
}
