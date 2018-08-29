//
//  HomeViewController.swift
//  mobilecv
//
//  Created by Do Toan on 8/24/18.
//  Copyright © 2018 Do Toan. All rights reserved.
//

import UIKit
import RxSwift
import Hero

class HomeViewController: BaseViewController {
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    @IBOutlet weak var glidingView: GlidingCollection!
    let disposeBag = DisposeBag()
    var viewModel: HomeViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        bindViewModel()
        setupGlidingCollectionView()
    }

    private func setupGlidingCollectionView() {
        glidingView.dataSource = self
        
        let nib = UINib(nibName: CategoryItemCell.className, bundle: nil)
        glidingView.collectionView.register(nib, forCellWithReuseIdentifier: CategoryItemCell.className)
        glidingView.collectionView.delegate = self
        glidingView.collectionView.dataSource = self
        glidingView.collectionView.backgroundColor = glidingView.backgroundColor
    }
    
    private func bindViewModel() {
        viewModel = HomeViewModel(disboseBag: self.disposeBag)
        viewModel.isLoadingObservable
            .bind(to: self.loadingView.rx.isAnimating)
            .disposed(by: self.disposeBag)
        viewModel.isLoadingObservable
            .map{ !$0 }
            .bind(to: self.loadingView.rx.isHidden)
            .disposed(by: self.disposeBag)
        viewModel.fetchListCategoryWithResume()
            .observeOn(MainScheduler.instance)
            .subscribe( onNext: { [weak self] _ in
                print("get list cate done")
                self?.glidingView.reloadData()
                self?.glidingView.collectionView.reloadData()
            })
            .disposed(by: disposeBag)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let section = glidingView.expandedItemIndex
        return (viewModel.getListResume(ofCategoryAtIndex: section)?.count ?? 0) + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryItemCell.className, for: indexPath) as? CategoryItemCell else { return UICollectionViewCell() }
        let section = glidingView.expandedItemIndex
        if let listResume = viewModel.getListResume(ofCategoryAtIndex: section) {
            let resume = listResume.count > indexPath.row
                ? listResume[indexPath.row]
                : viewModel.placeholderResume
            cell.bindViewModel(viewModel: resume)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let section = glidingView.expandedItemIndex
        let item = indexPath.item
        print("Selected item #\(item) in section #\(section)")
        
        let category = viewModel.getCategory(at: section)!
        if item >= category.listResume!.count {
            return
        }
        
        let vModel = ResumeDetailViewModel()
        vModel.resume = category.listResume![item]
        let newVC = ResumeDetailViewController(nibName: "ResumeDetailViewController", bundle: nil)
        newVC.viewModel = vModel
        newVC.hero.isEnabled = true
        self.present(newVC, animated: true, completion: nil)
    }
}

extension HomeViewController: GlidingCollectionDatasource, GlidingCollectionDelegate {
    func numberOfItems(in collection: GlidingCollection) -> Int {
        return viewModel.listCategory.value.count
    }
    
    func glidingCollection(_ collection: GlidingCollection, itemAtIndex index: Int) -> String {
        let category = viewModel.getCategory(at: index)
        return category?.name ?? ""
    }
}
