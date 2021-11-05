//
//  extension+OpportunitiesView.swift
//  herconomyApp
//
//  Created by Decagon on 04/11/2021.
//

import UIKit
// MARK: - EXTENSION
extension  OpportunitiesViewController{
  func getdata() {
    loadData.fetchData { [self] (data) in
      details = data
    }
    
  }
                
  // MARK: - FUNCTION
  func addDefaultViews() {
    view.addSubview(investmentcollectionView)
    view.addSubview(fundingCollectionView)
  }
  // MARK: - FUNCTION TO SET VIEW CONSTRIANT
  func constraintViews() {
    addDefaultViews()
    investmentcollectionView.anchorWithConstantsToTop(top: segmentedControl2.topAnchor,
                                            left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 50, leftConstant: 30, bottomConstant: 170, rightConstant: 30)
//    fundingCollectionView.anchorWithConstantsToTop(top: searchField.topAnchor,
//                                            left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 100, leftConstant: 30, bottomConstant: 200, rightConstant: 30)
  }
  // MARK: - COLLECTION VIEW
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return cards.count
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      guard let investCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? InvestmentCollectionView else { return UICollectionViewCell()
    }
     investCell.layer.cornerRadius = 50
      let card = cards[indexPath.row]
      investCell.card = card
      return  investCell
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
