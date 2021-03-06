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
      title.text = card.title
      percentAndTimeLabel.text = card.duration
      amountLabel.text = card.amount
      riskLevelLabel.text =  card.riskLevel
      riskLabel.text = card.risk
      amountRange.text = card.amountRange
      if card.description == "  sold out  " {
        descriptionLabel.text = card.description
        descriptionLabel.textColor  = .red
      } else {
        descriptionLabel.text = card.description
        descriptionLabel.textColor  = .green
      }
      
    }
  }
  
  // MARK: - FUNCTION TO GET URL OF THE IMAGE
  func configure(with urlString: String){
    guard let url = URL(string: urlString) else {
      return
    }
    
    URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
      guard let data = data , error == nil else {
        return
      }
      
      DispatchQueue.main.async {
        let image = UIImage(data: data)
        self?.imageView.image = image
      }
    }.resume()
  }
  
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
    // label.text = "Shecluded Fixed \nIncome Investment"
    label.font = UIFont(name: "Helvicta", size: 13)
    label.numberOfLines = 2
    return label
  }()
  
  lazy var percentAndTimeLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .lightGray
    label.font = UIFont(name: "Helvicta", size: 13)
    label.numberOfLines = 2
    return label
  }()
  
  lazy var amountLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont(name: "Helvicta", size: 13)
    label.numberOfLines = 2
    return label
  }()
  
  lazy var amountRange: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .lightGray
    label.font = UIFont(name: "Helvicta", size: 13)
    label.numberOfLines = 2
    return label
  }()
  
  lazy var riskLevelLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    //label.text = "Low"
    label.font = UIFont(name: "Helvicta", size: 13)
    label.numberOfLines = 2
    return label
  }()
  
  lazy var riskLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .lightGray
    label.font = UIFont(name: "Helvicta", size: 13)
    label.numberOfLines = 2
    return label
  }()
  
  lazy var descriptionLabel: UITextField = {
    let label = UITextField()
    label.translatesAutoresizingMaskIntoConstraints = false
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
      title.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 420),
      title.topAnchor.constraint(equalTo: topAnchor, constant: 20),
      
      percentAndTimeLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 420),
      percentAndTimeLabel.topAnchor.constraint(equalTo: title.topAnchor, constant: 50),
      
      amountLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 420),
      amountLabel.topAnchor.constraint(equalTo: percentAndTimeLabel.topAnchor, constant: 50),
      
      riskLevelLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 520),
      riskLevelLabel.topAnchor.constraint(equalTo: percentAndTimeLabel.topAnchor, constant: 50),
      
      riskLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 520),
      riskLabel.topAnchor.constraint(equalTo: riskLevelLabel.topAnchor, constant: 20),
      
      amountRange.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 420),
      amountRange.topAnchor.constraint(equalTo: amountLabel.topAnchor, constant: 20),
      
      descriptionLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 420),
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

