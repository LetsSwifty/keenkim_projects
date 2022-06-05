//
//  FeedCollectionViewCell.swift
//  Unsplash_Ex
//
//  Created by KEEN on 2022/06/05.
//

import UIKit
import SnapKit
import Kingfisher

class FeedCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    static var cellIdentifier = "feedCollectionViewCell"
    
    // MARK: - UI
    let imageView: UIImageView = {
        let v = UIImageView()
        v.layer.cornerRadius = 8
        v.layer.borderWidth = 1
        v.layer.borderColor = .appCGColor(.main)
        v.clipsToBounds = true
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.image = nil
    }
    
    // MARK: Layout
    override func layoutSubviews() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(6)
        }
    }
    
    // MARK: Cell Configure
    func congifure(unsplash: UnsplashType) {
        imageView.backgroundColor = .white
        imageView.kf.setImage(with: unsplash.urls.regularUrl, placeholder: UIImage(named: "placeholder"))
    }
}

