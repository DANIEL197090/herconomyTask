//
//  HomeViewController.swift
//  herconomyApp
//
//  Created by Decagon on 04/11/2021.
//

import UIKit

class OpportunitiesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
  // MARK: - VARIABLE TO HOLD ALL CARD IN AN ARRAY
  
  //let cards: [Card] = {
    //let  firstCard = 
//    let firstCard = Card(title: "" time: "20 mins", imageName: AppImages.anxietyProblems.image)
//    let secondCard = Card(title: AppImages.sleepBetter.image, time: "35 mins", imageName: AppImages.anxietyProblems.image)
//    let thirdCard = Card(title: AppImages.creativeBlock.image, time: "15 mins", imageName: AppImages.creativeBlock.image)
//    return [firstCard, secondCard, thirdCard]
  //}()
  
  lazy var  viewWrapper: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)
    view.layer.cornerRadius = 40
    view.isUserInteractionEnabled = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
lazy var opportunityLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Opportunity Board"
    label.font  = UIFont.boldSystemFont(ofSize: 25.0)
    label.textColor = .white
    label.textAlignment = .center
    label.numberOfLines = 1
    return label
  }()
  

  lazy var searchField: LeftPaddedTextField = {
    let textField = LeftPaddedTextField()
    textField.layer.borderColor = UIColor.black.cgColor
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.00)
    textField.layer.cornerRadius = 24
    textField.autocapitalizationType = .none
    textField.layer.shadowColor = UIColor.gray.cgColor
    textField.layer.shadowOpacity = 1
    textField.layer.shadowRadius = 4.0
    textField.placeholder = "search"
    return textField
  }()
  
  lazy var agriculureLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = "A"
      label.font  = UIFont.boldSystemFont(ofSize: 25.0)
      label.textColor = .white
      label.textAlignment = .center
      label.numberOfLines = 1
      return label
    }()
 
  lazy var segmentedItems = ["Investment","Funding","others"]
  lazy var segmentedControl: UISegmentedControl = {
    let segmentedControl = UISegmentedControl(items: segmentedItems)
    segmentedControl.selectedSegmentIndex = 0
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    segmentedControl.selectedSegmentTintColor =  .systemOrange
    segmentedControl.addTarget(self, action: #selector(controlChanged), for: .valueChanged)
    segmentedControl.backgroundColor = .white
    return segmentedControl
  }()
  
  
  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 45
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.backgroundColor =  UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
    collectionView.showsVerticalScrollIndicator = false
    collectionView.layer.cornerRadius = 10
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()
  let cellId = "cellId"
  override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .systemOrange
    collectionView.register(InvestmentCollectionView.self, forCellWithReuseIdentifier: cellId)
      setupConstriants()
      constraintViews()
    }
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
  }

  func setupConstriants() {
    view.addSubview(viewWrapper)
    view.addSubview(opportunityLabel)
    view.addSubview(segmentedControl)
    view.addSubview(searchField)
//    navigationItem.leftBarButtonItem = UIBarButtonItem(image: "rice"., style: <#T##UIBarButtonItem.Style#>, target: <#T##Any?#>, action: <#T##Selector?#>

    NSLayoutConstraint.activate([
      opportunityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
      opportunityLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
      viewWrapper.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
      viewWrapper.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
      viewWrapper.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
      viewWrapper.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
      segmentedControl.topAnchor.constraint(equalToSystemSpacingBelow: viewWrapper.topAnchor, multiplier: 5),
      segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
      segmentedControl.heightAnchor.constraint(equalToConstant: 50),
      segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
      searchField.topAnchor.constraint(equalTo: segmentedControl.topAnchor, constant: 70),
      searchField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
      searchField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
      searchField.heightAnchor.constraint(equalToConstant: 50),
    ])
  }
  
  @objc func click(){
    
  }
  class LeftPaddedTextField: UITextField {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
      return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
      return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
  }

  var titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
  @objc func controlChanged() {
    switch segmentedControl.selectedSegmentIndex {
    case 0 :
      collectionView.backgroundColor = .red
    case 1:
      collectionView.backgroundColor = .blue
      
    default:
      collectionView.backgroundColor = .green
    }
  }
}


