//
//  FavoritesViewController.swift
//  BookShelfApp
//
//  Created by KEEN on 2022/05/08.
//

import UIKit

class FavoritesViewController: BaseViewController {
  
  // MARK: - Properties
  let favoritesView = MovieListView()
  var favoritesList: [Book] = []
  
  // MARK: - View Life-Cycle
  override func loadView() {
    view = favoritesView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    favoritesView.tableView.delegate = self
    favoritesView.tableView.dataSource = self
    fetchData()
    configureNagivationBar()
  }
  
  func fetchData() {
    // TODO: fetch stored data
  }
  
  private func configureNagivationBar() {
    title = "즐겨찾기 목록"
    
    let leftBarButton = UIBarButtonItem(image: UIImage(systemName: "multiply"), style: .done, target: self, action: #selector(onDone))
    self.navigationItem.leftBarButtonItem = leftBarButton
  }
  
  @objc func onDone() {
    self.dismiss(animated: true)
  }
  
}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return favoritesList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
    let book = favoritesList[indexPath.row]
    cell.infoView.configure(book: book)
    cell.delegate = self
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return Metric.cellHeight
  }
  
}

// MARK: Extension - SearchTableViewCellDelegate
extension FavoritesViewController: SearchTableViewCellDelegate {
  func starButtonClicked(searchTableViewCell: SearchTableViewCell) {
    print(#function)
    // TODO: 즐겨찾기 취소 구현
  }
}
