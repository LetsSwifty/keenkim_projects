//
//  FeedView.swift
//  Unsplash_Ex
//
//  Created by KEEN on 2022/06/05.
//

import UIKit
import SnapKit

protocol GridViewDelegate {
    func onSelected(item: UnsplashType)
}

final class FeedView: UIView {
    // MARK: - Properties
    private var items: [UnsplashType] = []
    private var gridViewDelegate: GridViewDelegate? = nil
    
    // MARK: - Metric
    struct Metric {
        static var screenSize = UIScreen.main.bounds
        static var screenWidth = screenSize.width
        static var screenHeight = screenSize.height
    }
    
    // MARK: - UI
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: Metric.screenWidth / 3,
                                 height: Metric.screenWidth / 3)
        
        let v = UICollectionView(frame: .zero, collectionViewLayout: layout)
        v.backgroundColor = .appColor(.background)
        v.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: FeedCollectionViewCell.cellIdentifier)
        return v
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(collectionView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    override func layoutSubviews() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
    func updateView(data: [UnsplashType], isAppend: Bool = false) {
        if isAppend {
            items.append(contentsOf: data)
        } else {
            items = data
        }
        
        self.collectionView.reloadData()
    }
}

