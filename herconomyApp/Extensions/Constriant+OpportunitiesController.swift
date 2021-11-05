//
//  Constriant+OpportunitiesController.swift
//  herconomyApp
//
//  Created by Decagon on 05/11/2021.
//

import UIKit
extension OpportunitiesViewController {
  // MARK: - CONSTRIANTS OF ALL VIEWS
  func setupConstriants() {
    view.addSubview(viewWrapper)
    view.addSubview(opportunityLabel)
    view.addSubview(segmentedControl)
    view.addSubview(searchField)
    view.addSubview(segmentedControl2)
    view.addSubview(fundingSegmentedControl)
    view.addSubview(othersSegmentedControl)
    view.addSubview(fundingview)
    view.addSubview(othersView)
    
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
      
      segmentedControl2.topAnchor.constraint(equalTo:searchField.topAnchor, constant: 55),
      segmentedControl2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
      segmentedControl2.heightAnchor.constraint(equalToConstant: 50),
      
      fundingSegmentedControl.topAnchor.constraint(equalTo:searchField.topAnchor, constant: 55),
      fundingSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
      fundingSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
      fundingSegmentedControl.heightAnchor.constraint(equalToConstant: 50),
      
      othersSegmentedControl.topAnchor.constraint(equalTo:searchField.topAnchor, constant: 55),
      othersSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
      othersSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
      othersSegmentedControl.heightAnchor.constraint(equalToConstant: 50),
      
      fundingview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
      fundingview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      fundingview.topAnchor.constraint(equalTo: fundingSegmentedControl.topAnchor, constant: 70),
      fundingview.heightAnchor.constraint(equalToConstant: 200),
      
      othersView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
      othersView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      othersView.topAnchor.constraint(equalTo: fundingSegmentedControl.topAnchor, constant: 70),
      othersView.heightAnchor.constraint(equalToConstant: 200)
      
    ])
  }
  
  class LeftPaddedTextField: UITextField {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
      return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
      return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
  }
}
