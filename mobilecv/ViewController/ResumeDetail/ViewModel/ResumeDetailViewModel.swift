//
//  ResumeDetailViewModel.swift
//  mobilecv
//
//  Created by Do Toan on 8/28/18.
//  Copyright © 2018 Do Toan. All rights reserved.
//

import UIKit
import RxSwift

class ResumeDetailViewModel: BaseViewModel {
    var listCompany = Variable<[CompanyInfoModel]>([])
    
    var resume: ResumeModel! {
        didSet {
            self.listCompany.value = resume.listCompany ?? []
        }
    }
}
