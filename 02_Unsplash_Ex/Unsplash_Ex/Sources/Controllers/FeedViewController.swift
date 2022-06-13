//
//  ViewController.swift
//  Unsplash_Ex
//
//  Created by KEEN on 2022/06/05.
//

import UIKit

class FeedViewController: UIViewController {
    // MARK: - Properties
    let apiService = APIService()
    var feedView = FeedView()
    var unsplashList: [UnsplashType] = []
    var page: Int = 1
    
    // MARK: Life-Cycle
    override func loadView() {
        view = feedView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        fetchImages()
    }
    
    // MARK: - Configure
    func configure() {
        self.title = "Feed"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        feedView.collectionView.dataSource = self
        feedView.collectionView.delegate = self
    }
    
    // MARK: - Network
    func fetchImages(page: Int = 1) {
        apiService.fetchUnplash(page: page) { images, error in
            switch error {
            case .success:
                if let fetchList = images {
                    self.unsplashList.append(contentsOf: fetchList)
                    
                    DispatchQueue.main.async {
                        self.feedView.collectionView.reloadData()
                    }
                }
                
            case .failure:
                print("fetch fail..")
            }
        }
    }
}

// MARK: - Extensions
extension FeedViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if feedView.collectionView.contentOffset.y >= (feedView.collectionView.contentSize.height - feedView.collectionView.bounds.size.height) {
            page += 1
            fetchImages(page: page)
        }
    }
}

extension FeedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return unsplashList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionViewCell.cellIdentifier, for: indexPath) as? FeedCollectionViewCell else { return UICollectionViewCell() }
        cell.congifure(unsplash: unsplashList[indexPath.row])
        
        return cell
    }
}
