//
//  ProjectDetailViewModel.swift
//  mobilecv
//
//  Created by Do Toan on 8/29/18.
//  Copyright © 2018 Do Toan. All rights reserved.
//

import UIKit
import RxSwift

class ProjectDetailViewModel: BaseViewModel {
    var listProject = Variable<[ProjectModel]>([])
    var projectIndex: Int!
    var companyInfo: CompanyInfoModel! {
        didSet {
            self.listProject.value = companyInfo.listProject ?? []
        }
    }
    
    func getProject(atIndex: NSInteger) -> ProjectModel? {
        if atIndex >= 0 && atIndex < listProject.value.count {
            return listProject.value[atIndex]
        }
        return nil
    }
}
