//
//  HomeViewController.swift
//  herconomyApp
//
//  Created by Decagon on 04/11/2021.
//

import UIKit

class OpportunitiesViewController: UIViewController {
  
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
  
  lazy var segmentedItems = ["Investment","Funding","others"]
  lazy var segmentedControl: UISegmentedControl = {
    let segmentedControl = UISegmentedControl(items: segmentedItems)
    segmentedControl.selectedSegmentIndex = 0
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    segmentedControl.selectedSegmentTintColor =  .systemOrange
    segmentedControl.addTarget(self, action: #selector(controlChanged), for: .valueChanged)
    return segmentedControl
  }()
  
  lazy var views: UIView = {
    let view = UIView()
    view.backgroundColor = .orange
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .systemOrange
      setupConstriants()
    }
  
  func setupConstriants() {
    view.addSubview(viewWrapper)
    view.addSubview(opportunityLabel)
    view.addSubview(segmentedControl)
    view.addSubview(views)
    
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
      views.topAnchor.constraint(equalTo: segmentedControl.topAnchor, constant: 100),
      views.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
      views.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
      views.heightAnchor.constraint(equalToConstant: 200)
    ])
  }
  
  @objc func controlChanged() {
    switch segmentedControl.selectedSegmentIndex {
    case 0 :
      views.backgroundColor = .red
    case 1:
      views.backgroundColor = .green
    default:
      views.backgroundColor = .blue

    }
  }
}


