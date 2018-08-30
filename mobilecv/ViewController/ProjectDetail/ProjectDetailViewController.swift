
//  ProjectDetailViewController.swift
//  mobilecv
//
//  Created by Do Toan on 8/29/18.
//  Copyright © 2018 Do Toan. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources

class ProjectDetailViewController: BaseViewController {
    var viewModel: ProjectDetailViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var headerView: UIView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var roleLabel1: UILabel!
    @IBOutlet weak var roleLabel2: UILabel!
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var companyLogo: UIImageView!
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var headerBgView: UIView!
    
    private let disposeBag = DisposeBag()
//    private let datasource = RxTableViewSectionedReloadDataSource<SectionModel<String, ProjectModel>>()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        bindViewModel()
    }

    func setupView() {
        if let company = viewModel.companyInfo {
            companyNameLabel.text = company.name
            roleLabel1.text = company.role
            companyLogo.kf.setImage(with: URL(string: company.logo ?? ""))
//            roleLabel2.text = company.role
//            indexLabel.text = "#\(viewModel.projectIndex!)"
            startDateLabel.text = company.startDate
            endDateLabel.text = company.endDate
            leftView.backgroundColor = UIColor.randomColor(index: viewModel.projectIndex!)
            descriptionLabel.text = company.shortDescription
            headerView.frame = CGRect(x: 0, y: 0, width: headerView.frame.size.width, height: headerBgView.frame.size.height + 20)
            UIView.recursiveSetHeroId(view: headerView, identifier: "\(company.name ?? "")")
            UIView.recursiveSetHeroId(view: companyNameLabel.superview!, identifier: "\(company.name ?? "")")
        }
    }

    func bindViewModel() {
        tableView.tableHeaderView = headerView
        tableView.register(ProjectTableViewCell.getNib(), forCellReuseIdentifier: ProjectTableViewCell.getIdentifier())
        tableView.rx.setDelegate(self).disposed(by: self.disposeBag)
        viewModel.listProject.asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: ProjectTableViewCell.getIdentifier(), cellType: ProjectTableViewCell.self)) { row, element, cell in
                cell.setupCell(project: element, index: row + 1)
                cell.hero.modifiers = [.fade, .scale(0.5)]
            }
            .disposed(by: disposeBag)
    }
    
    @IBAction func closeView() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension ProjectDetailViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let project = viewModel.getProject(atIndex: indexPath.row) {
            return ProjectTableViewCell.getCellHeight(model: project)
        }
        return 100
    }
}
