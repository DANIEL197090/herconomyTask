//
//  extension+OpportunitiesView.swift
//  herconomyApp
//
//  Created by Decagon on 04/11/2021.
//

import UIKit
// MARK: - EXTENSION
extension  OpportunitiesViewController{
  // MARK: - FUNCTION TO GET DATA FROM THE API
  func getdata() {
    loadData.fetchData { [self] (data) in
      details = data
      print(details as Any)
    }    
  }
                
  // MARK: - FUNCTION
  func addDefaultViews() {
    view.addSubview(collectionView)
    view.addSubview(fundingCollectionView)
  }
  // MARK: - FUNCTION TO SET VIEW CONSTRIANT
  func constraintViews() {
    addDefaultViews()
    collectionView.anchorWithConstantsToTop(top: segmentedControl2.topAnchor,
                                            left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 50, leftConstant: 30, bottomConstant: 170, rightConstant: 30)
  }
  
  
  // MARK: - COLLECTION VIEW
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if segmentedControl.selectedSegmentIndex == 0 {
      return investmentCards.count
    } else if segmentedControl.selectedSegmentIndex == 1  {
      return fundingCards.count
    }else {
      return othersCards.count
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    if segmentedControl.selectedSegmentIndex == 0 {
      guard let investCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? CollectionView else { return UICollectionViewCell()
    }
     investCell.layer.cornerRadius = 50
      let card = investmentCards[indexPath.row]
      investCell.card = card
      return  investCell
      
    } else if  segmentedControl.selectedSegmentIndex == 1 {
      guard let investCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? CollectionView else { return UICollectionViewCell()
    }
     investCell.layer.cornerRadius = 50
      let card = fundingCards[indexPath.row]
      investCell.card = card
      return  investCell
    }  else {
      guard let investCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? CollectionView else { return UICollectionViewCell()
    }
     investCell.layer.cornerRadius = 50
      let card = othersCards[indexPath.row]
      investCell.card = card
      return  investCell
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: 220)
  }
}

extension UIView {
    func anchorToTop(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil) {
        anchorWithConstantsToTop(top: top, left: left, bottom: bottom, right: right, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
    }
    func anchorWithConstantsToTop(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil,
                                  bottom: NSLayoutYAxisAnchor? = nil,
                                  right: NSLayoutXAxisAnchor? = nil,
                                  topConstant: CGFloat = 0,
                                  leftConstant: CGFloat = 0,
                                  bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: topConstant).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: leftConstant).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -rightConstant).isActive = true
        }
    }
}
