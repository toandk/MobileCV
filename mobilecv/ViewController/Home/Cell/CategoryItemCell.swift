//
//  CategoryItemCell.swift
//  mobilecv
//
//  Created by Do Toan on 8/26/18.
//  Copyright © 2018 Do Toan. All rights reserved.
//

import UIKit
import Kingfisher
import Hero

class CategoryItemCell: BaseCollectionViewCell, ReactiveView {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var avatarView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.clipsToBounds = true
        setupShadow()
//        self.hero.isEnabled = true
    }
    
    func setupShadow() {
        let layer = self.layer
        let config = GlidingConfig.shared
        layer.shadowOffset = config.cardShadowOffset
        layer.shadowColor = config.cardShadowColor.cgColor
        layer.shadowOpacity = config.cardShadowOpacity
        layer.shadowRadius = config.cardShadowRadius
        
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
    
    func bindViewModel(viewModel: AnyObject) {
        if let resume = viewModel as? ResumeModel {
            if resume.localFile != nil {
                imgView.image = UIImage(named: resume.localFile!)
            }
            else {
                imgView.kf.setImage(with: URL(string: resume.cover ?? ""))
            }
            avatarView.kf.setImage(with: URL(string: resume.avatar ?? ""))
            nameLabel.text = resume.username
            UIView.recursiveSetHeroId(view: self.contentView, identifier: resume.userId ?? "")
        }
    }
}
