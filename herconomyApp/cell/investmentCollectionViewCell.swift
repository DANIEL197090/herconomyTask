//
//  investmentCollectionViewCell.swift
//  herconomyApp
//
//  Created by Decagon on 04/11/2021.
//

import UIKit
class InvestmentCollectionView: UICollectionViewCell {
  // MARK: - VARIABLE
//  var card: Card? {
//    didSet {
//      guard let card = card else {
//        return
//      }
//      let imageName = card.imageName
//      imageView.image = UIImage(named: imageName)
////      let title = card.title
////      nameLabel.text = title
////      let time = card.time
////      timeLabel.text = time
//    }
//  }
  // MARK: - IMAGE LABEL
  lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "rice")
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  lazy var title: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Shecluded Fixed \nIncome Investment"
    label.font = UIFont(name: "Helvicta", size: 13)
    label.numberOfLines = 2
    return label
  }()
  
  lazy var percentAndTimeLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "15.00% in 12 months"
    label.textColor = .lightGray
    label.font = UIFont(name: "Helvicta", size: 13)
    label.numberOfLines = 2
    return label
  }()
  
  lazy var amountLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "#10000"
    label.font = UIFont(name: "Helvicta", size: 13)
    label.numberOfLines = 2
    return label
  }()
  
  lazy var amountRange: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Minimum"
    label.textColor = .lightGray
    label.font = UIFont(name: "Helvicta", size: 13)
    label.numberOfLines = 2
    return label
  }()
  
  lazy var riskLevelLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Low"
    label.font = UIFont(name: "Helvicta", size: 13)
    label.numberOfLines = 2
    return label
  }()
  
  
  lazy var riskLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Risk"
    label.textColor = .lightGray
    label.font = UIFont(name: "Helvicta", size: 13)
    label.numberOfLines = 2
    return label
  }()
  
  lazy var descriptionLabel: UITextField = {
    let label = UITextField()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "  available  "
    label.backgroundColor = .lightGray
    label.textColor = .green
    label.layer.cornerRadius = 5
    label.font = UIFont(name: "Helvicta", size: 10)
    return label
  }()
  
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUpView()
  }
  // MARK: - FUNCTION TO SET UP VIEWS
  func setUpView() {
    backgroundColor = .white
    addSubview(imageView)
    addSubview(title)
    addSubview(title)
    addSubview(percentAndTimeLabel)
    addSubview(amountLabel)
    addSubview(riskLevelLabel)
    addSubview(amountRange)
    addSubview(riskLabel)
    addSubview(descriptionLabel)
   NSLayoutConstraint.activate([
      title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
      title.topAnchor.constraint(equalTo: topAnchor, constant: 20),
      
      percentAndTimeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
      percentAndTimeLabel.topAnchor.constraint(equalTo: title.topAnchor, constant: 50),
      
      amountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -135),
      amountLabel.topAnchor.constraint(equalTo: percentAndTimeLabel.topAnchor, constant: 50),
      
      riskLevelLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
      riskLevelLabel.topAnchor.constraint(equalTo: percentAndTimeLabel.topAnchor, constant: 50),
      
      riskLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
      riskLabel.topAnchor.constraint(equalTo: riskLevelLabel.topAnchor, constant: 20),
      
      amountRange.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -130),
      amountRange.topAnchor.constraint(equalTo: amountLabel.topAnchor, constant: 20),
      
      descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -120),
      descriptionLabel.topAnchor.constraint(equalTo: amountRange.topAnchor, constant: 40),
      
      imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -235),
      imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
      imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
      imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),

     
    ])
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

