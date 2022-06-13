//
//  BookInfoView.swift
//  BookShelfApp
//
//  Created by KEEN on 2022/05/08.
//


import UIKit
import SnapKit
import Kingfisher

class BookInfoView: UIView, ViewRepresentable {

  // MARK: - UI
  let posterImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(systemName: "square.slash")
    imageView.contentMode = .scaleAspectFit
    imageView.backgroundColor = .white
    imageView.tintColor = .systemGreen
    return imageView
  }()
  
  let verticalStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.spacing = 5
    return stackView
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "title"
    label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    return label
  }()
  
  let authorLabel: UILabel = {
    let label = UILabel()
    label.text = "author"
    label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
    return label
  }()
  
  let priceLabel: UILabel = {
    let label = UILabel()
    label.text = "price"
    label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
    return label
  }()
  
  let starButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(systemName: "star"), for: .normal)
    button.setImage(UIImage(systemName: "star.fill"), for: .selected)
    button.tintColor = .systemGreen
    return button
  }()
  
  // MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    createViews()
    setConstraints()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Configure
  func configure(book: Book) {
    let imageUrl = URL(string: book.image)
  
    posterImageView.kf.setImage(with: imageUrl, placeholder: UIImage(systemName: "square.slash"))
    titleLabel.text = book.title
    authorLabel.text = "작가: \(book.author.checkIsEmpty)"
    priceLabel.text = "가격: \(book.price.checkIsEmpty) 원"
  }
  
  func createViews() {
    [titleLabel, authorLabel, priceLabel].forEach {
      verticalStackView.addArrangedSubview($0)
    }
    
    [posterImageView, verticalStackView, starButton].forEach {
      addSubview($0)
    }
  }
  
  func setConstraints() {
    [posterImageView, verticalStackView, starButton, titleLabel, authorLabel, priceLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }

    let safeArea = safeAreaLayoutGuide
    let buttonWidth: CGFloat = 20
    
    posterImageView.snp.makeConstraints {
      $0.width.equalTo(posterImageView.snp.height).multipliedBy(0.7)
      $0.leading.equalTo(safeArea).offset(10)
      $0.top.equalTo(safeArea).offset(10)
      $0.bottom.equalTo(safeArea).offset(-10)
    }
    
    verticalStackView.snp.makeConstraints {
      $0.leading.equalTo(posterImageView.snp.trailing).offset(10)
      $0.top.equalTo(safeArea).offset(15)
      $0.bottom.equalTo(safeArea).offset(-15)
      $0.trailing.equalTo(safeArea).offset(-10)
    }
    
    starButton.snp.makeConstraints {
      $0.width.height.equalTo(buttonWidth)
      $0.trailing.equalTo(safeArea).offset(-10)
      $0.top.equalTo(safeArea).offset(10)
    }
  }
  
}

