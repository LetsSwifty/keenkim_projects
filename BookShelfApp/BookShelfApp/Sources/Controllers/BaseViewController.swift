//
//  BaseViewController.swift
//  BookShelfApp
//
//  Created by KEEN on 2022/05/07.
//

import UIKit

class BaseViewController: UIViewController {
  
  // MARK: - Metric
  struct Metric {
    static let cellHeight: CGFloat = 110
  }
  
  // MARK: - View Life-Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    navigationController?.navigationBar.backgroundColor = .white
    navigationController?.navigationBar.tintColor = .systemGreen
  }
  
}
