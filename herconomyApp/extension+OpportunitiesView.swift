//
//  extension+OpportunitiesView.swift
//  herconomyApp
//
//  Created by Decagon on 04/11/2021.
//

import UIKit
// MARK: - EXTENSION
extension  OpportunitiesViewController{
  // MARK: - FUNCTION
  func addDefaultViews() {
    view.addSubview(collectionView)
  }
  // MARK: - FUNCTION TO SET VIEW CONSTRIANT
  func constraintViews() {
    addDefaultViews()
    collectionView.anchorWithConstantsToTop(top: searchField.topAnchor,
                                            left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 100, leftConstant: 30, bottomConstant: 200, rightConstant: 30)
  }
  // MARK: - COLLECTION VIEW
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    5
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//    guard let investCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? InvestmentCollectionView else { return UICollectionViewCell()
     let  investCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath as IndexPath)

            // cell.backgroundColor = UIColor.green
    //}
   investCell.layer.cornerRadius = 60
    //let card = cards[indexPath.row]
    //exploreCell.card = card
    return  investCell
    
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: 200)
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
