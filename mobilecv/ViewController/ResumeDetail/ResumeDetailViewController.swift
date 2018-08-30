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
        tableView.register(ResumeDetailCell.getNib(), forCellReuseIdentifier: ResumeDetailCell.getIdentifier())
        tableView.estimatedRowHeight = 154
        tableView.rowHeight = 154
        viewModel.listCompany.asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: ResumeDetailCell.getIdentifier(), cellType: ResumeDetailCell.self)) { row, element, cell in
//                cell.setupCell(company: element, index: row + 1)
            }
            .disposed(by: disposeBag)
        tableView
            .rx
            .itemSelected
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] indexPath in
                self?.showProjectDetail(indexPath: indexPath)
            })
            .disposed(by: disposeBag)
    }
    
    func showProjectDetail(indexPath: IndexPath) {
        if let company = viewModel.getCompany(atIndex: indexPath.row) {
            if let cell = tableView.cellForRow(at: indexPath) {
                UIView.recursiveSetHeroId(view: cell.contentView, identifier: "\(company.name ?? "")")
            }
            let vModel = ProjectDetailViewModel()
            vModel.companyInfo = company
            vModel.projectIndex = indexPath.row + 1
            let newVC = ProjectDetailViewController(nibName: "ProjectDetailViewController", bundle: nil)
            newVC.viewModel = vModel
            newVC.hero.isEnabled = true
            self.present(newVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func backViewAction() {
        self.hero.dismissViewController()
    }
}
