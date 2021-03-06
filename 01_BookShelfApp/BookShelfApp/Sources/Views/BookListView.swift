//
//  BookListView.swift
//  BookShelfApp
//
//  Created by KEEN on 2022/05/08.
//

import UIKit
import SnapKit

class MovieListView: UIView, ViewRepresentable {
  
  // MARK: - UI
  let tableView: UITableView = {
    let tableView = UITableView()
    return tableView
  }()
  
  // MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    registerCells()
    createViews()
    setConstraints()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Configure
  func registerCells() {
    tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
  }
  
  func createViews() {
    addSubview(tableView)
  }
  
  func setConstraints() {
    tableView.translatesAutoresizingMaskIntoConstraints = false
    
    tableView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
}
