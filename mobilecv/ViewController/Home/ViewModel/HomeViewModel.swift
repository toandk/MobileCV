//
//  HomeViewModel.swift
//  mobilecv
//
//  Created by Do Toan on 8/26/18.
//  Copyright © 2018 Do Toan. All rights reserved.
//

import UIKit
import RxSwift

class HomeViewModel: BaseViewModel {
    var listCategory = Variable<[CategoryModel]>([])
    var isLoading = Variable<Bool>(false)
    let apiController = APIController.sharedController
    let disboseBag: DisposeBag
    
    lazy var placeholderResume: ResumeModel = {
        var model = ResumeModel()
        model.localFile = "view_more.jpg"
        return model
    }()
    
    var isLoadingObservable: Observable<Bool> {
        return isLoading.asObservable()
    }
    
    init(disboseBag: DisposeBag) {
        self.disboseBag = disboseBag
        super.init()
        
        
    }
    
    func fetchListCategoryWithResume() -> Observable<[[ResumeModel]]> {
        return fetchListCategory().share()
            .flatMap{ [weak self] category in
                self?.fetchListResume(inCategory: category)
                    .catchError { error in
                        print("Error downloading task \(category)")
                        return .empty()
                    }
                    ?? Observable.empty()
            }
            .toArray()
            .do(onNext: { [weak self] _ in
                    self?.isLoading.value = false
                }, onError: { [weak self] _ in
                    self?.isLoading.value = false
            })
    }
    
    func fetchListCategory() -> Observable<CategoryModel> {
        self.isLoading.value = true
        return apiController
                .getListCategory()
                .do(onNext: { [weak self] list in
                    self?.listCategory.value = list
                })
                .flatMap{ Observable.from($0) }
    }
    
    func fetchListResume(inCategory category: CategoryModel) -> Observable<[ResumeModel]> {
        return apiController.getListResume(in: category.categoryId!, startAt: nil, limit: 5)
            .do(onNext: { list in
                category.listResume = list
            })
    }
    
    func getCategory(at index: NSInteger) -> CategoryModel? {
        return index >= 0 && index < listCategory.value.count
            ? listCategory.value[index]
            : nil
    }
    
    func getListResume(ofCategoryAtIndex index: NSInteger) -> [ResumeModel]? {
        return getCategory(at: index)?.listResume
    }
}
