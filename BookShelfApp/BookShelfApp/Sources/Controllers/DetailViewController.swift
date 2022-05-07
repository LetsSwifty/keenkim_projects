//
//  DetailViewController.swift
//  BookShelfApp
//
//  Created by KEEN on 2022/05/08.
//

import Foundation

class DetailViewController: BaseViewController {
  
  // MARK: Properties
  let detailView = DetailView()
  var book: Book?
  
  // MARK: View Life-Cycle
  override func loadView() {
    self.view = detailView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationController?.navigationBar.prefersLargeTitles = false
    
    if let book = book {
      let infoView = detailView.infoView
      infoView.configure(book: book)
      title = infoView.titleLabel.text
      
      if let url = URL(string: book.link) {
        let request = URLRequest(url: url)
        detailView.webView.load(request)
      }
    }
  }
  
}
