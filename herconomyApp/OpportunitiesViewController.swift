//
//  HomeViewController.swift
//  herconomyApp
//
//  Created by Decagon on 04/11/2021.
//

import UIKit

class OpportunitiesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
  // MARK: - VARIABLES
  var loadData = LoadData()
  var details : Details?
  // MARK: - VARIABLE TO HOLD ALL CARD IN AN ARRAY
  let cards: [Card] = {
    let firstCard = Card (title: "Shecluded fixed \n Income Investment", duration: "15.00% in 12 months", amount: "#10000", riskLevel: "Low", risk: "Risk", amountRange: "Minimum", description: "  availbale  ")
    let secondCard = Card (title: "Sweet potato", duration: "10.00% in 10 months", amount: "#95000", riskLevel: "#1000", risk: "Per unit", amountRange: "Remaining", description: "  availbale  ")
    let thirdCard = Card (title: "Rice Investment", duration: "20.00% in 5 months", amount: "#5000", riskLevel: "669", risk: "Per Unit", amountRange: "Remaining", description: "  sold out  ")
    return [firstCard, secondCard, thirdCard]
  }()
  

  // MARK: - VIEW WRAPPER
  lazy var  viewWrapper: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)
    view.layer.cornerRadius = 40
    view.isUserInteractionEnabled = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  // MARK: - VARIABLE DISPLAYING OPPORNUNITY BOARD
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
  // MARK: - VARIABLE SEARCH FIELD
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
  
  // MARK: - VARIABLE OF COLOR TITLE OF THE FIRST SEGMENTED CONTROL
  var titleTextAttribute = [NSAttributedString.Key.foregroundColor: UIColor.white]
  
  // MARK: - AN ARRAY OF SEGEMENTED CONTROL
  lazy var segmentedItems = ["Investment","Funding","others"]
  lazy var segmentedControl: UISegmentedControl = {
    let segmentedControl = UISegmentedControl(items: segmentedItems)
    segmentedControl.selectedSegmentIndex = 0
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    segmentedControl.selectedSegmentTintColor =  .systemOrange
    segmentedControl.setTitleTextAttributes(titleTextAttribute, for: .selected)
    segmentedControl.addTarget(self, action: #selector(controlChanged), for: .valueChanged)
    segmentedControl.backgroundColor = .white
    return segmentedControl
  }()
  
  // MARK: - AN ARRAY OF THE SECOND SEGEMENTED CONTROL
  lazy var segmentedItem2 = ["Agriculture", "Fixed Income"]
  
  // MARK: - VARIABLE OF COLOR TITLE OF THE SEGEMENTED SECOND SEGMENTED CONTROL
  var titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.orange]
  lazy var segmentedControl2: UISegmentedControl = {
    let segmentedControl = UISegmentedControl(items: segmentedItem2)
    segmentedControl.selectedSegmentIndex = 0
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    segmentedControl.selectedSegmentTintColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)
    segmentedControl.layer.borderWidth = 0
    segmentedControl.setTitleTextAttributes(titleTextAttributes, for: .selected)
    segmentedControl.addTarget(self, action: #selector(controlChanged), for: .valueChanged)
    segmentedControl.backgroundColor = .white
    return segmentedControl
  }()
  
  lazy var fundingSegmentedItem = ["Loans", "Grants"]
  lazy var fundingSegmentedControl: UISegmentedControl = {
    let segmentedControl = UISegmentedControl(items: fundingSegmentedItem)
    segmentedControl.selectedSegmentIndex = 0
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    segmentedControl.selectedSegmentTintColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)
    segmentedControl.isHidden = true
    segmentedControl.setTitleTextAttributes(titleTextAttributes, for: .selected)
    segmentedControl.addTarget(self, action: #selector(controlChanged), for: .valueChanged)
    segmentedControl.backgroundColor = .white
    return segmentedControl
  }()
  
  lazy var othersSegmentedItem = ["Scholarship", "Jobs"]
  lazy var othersSegmentedControl: UISegmentedControl = {
    let segmentedControl = UISegmentedControl(items: othersSegmentedItem)
    segmentedControl.selectedSegmentIndex = 0
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    segmentedControl.selectedSegmentTintColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)
    segmentedControl.isHidden = true
    segmentedControl.setTitleTextAttributes(titleTextAttributes, for: .selected)
    segmentedControl.addTarget(self, action: #selector(controlChanged), for: .valueChanged)
    segmentedControl.backgroundColor = .white
    return segmentedControl
  }()
  // MARK: - INVESTMENT COLLECTION VIEW
  lazy var investmentcollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 45
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.backgroundColor =  .clear
    collectionView.showsVerticalScrollIndicator = false
    collectionView.layer.cornerRadius = 10
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()
  
  lazy var fundingCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 45
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.backgroundColor =  .clear
    collectionView.showsVerticalScrollIndicator = false
    collectionView.layer.cornerRadius = 10
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()
  
  lazy var  fundingview: UIView = {
    let view = UIView()
    view.layer.cornerRadius = 40
    view.backgroundColor = .black
    view.isUserInteractionEnabled = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  lazy var  othersView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)
    view.layer.cornerRadius = 40
    view.backgroundColor = .orange
    view.isUserInteractionEnabled = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let cellId = "cellId"
  // MARK: - VIEW DID LOAD
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemOrange
    investmentcollectionView.register(InvestmentCollectionView.self, forCellWithReuseIdentifier: cellId)
    setupConstriants()
    constraintViews()
    getdata()
  }
  
  @objc func click(){}

  // MARK: - FUNCTION WHEN A SEGMENTED CONTROL IS SELECTED
  @objc func controlChanged() {
    switch segmentedControl.selectedSegmentIndex {
    case 0 :
      investmentcollectionView.backgroundColor = .clear
      segmentedControl2.isHidden =  false
      fundingSegmentedControl.isHidden = true
      investmentcollectionView.isHidden = false
      othersSegmentedControl.isHidden = true
      othersView.isHidden = true
      fundingview.isHidden = true
    case 1:
      investmentcollectionView.isHidden = true
      segmentedControl2.isHidden =  true
      fundingSegmentedControl.isHidden = false
      investmentcollectionView.isHidden = true
      othersSegmentedControl.isHidden = true
      fundingview.isHidden = false
      othersView.isHidden = true
    default:
      investmentcollectionView.backgroundColor = .clear
      fundingSegmentedControl.isHidden = true
      othersSegmentedControl.isHidden = false
      investmentcollectionView.isHidden = true
      othersView.isHidden = false
    }
  }
}


