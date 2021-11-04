//
//  investmentCollectionViewCell.swift
//  herconomyApp
//
//  Created by Decagon on 04/11/2021.
//

import UIKit
class InvestmentCollectionView: UICollectionViewCell {
  // MARK: - VARIABLE
  var card: Card? {
    didSet {
      guard let card = card else {
        return
      }
      let imageName = card.imageName
      imageView.image = UIImage(named: imageName)
//      let title = card.title
//      nameLabel.text = title
//      let time = card.time
//      timeLabel.text = time
    }
  }

  // MARK: - IMAGE LABEL
  lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  // MARK: - NEXT BUTTON LABEL
  lazy var nextButtonIcon: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "Button"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUpView()
  }
  // MARK: - FUNCTION TO SET UP VIEWS
  func setUpView() {
    backgroundColor = .white
    addSubview(imageView)
    addSubview(nextButtonIcon)
    NSLayoutConstraint.activate([
    
    ])
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

