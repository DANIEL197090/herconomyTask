//
//  HomeViewController.swift
//  herconomyApp
//
//  Created by Decagon on 04/11/2021.
//

import UIKit

class HomeViewController: UIViewController {
  
  override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .white
  
    navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .done, target: self, action: #selector(didTapButton))
    
    }
  
  @objc func didTapButton() {
    
  }

}

