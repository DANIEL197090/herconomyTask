//
//  ViewController.swift
//  herconomyApp
//
//  Created by Decagon on 04/11/2021.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
// MARK: Create instance of viewControllers
        let homeViewController = HomeViewController()
        let AddViewController = AddViewController()
        let OpportunitiesViewController = OpportunitiesViewController()
        let NotificationViewController = NotificationViewController()
        let EventsViewController = EventsViewController()
// MARK: Assign viewController to tab Bar
      self.setViewControllers([homeViewController, AddViewController,OpportunitiesViewController, NotificationViewController, EventsViewController], animated: false)
      guard let items = self.tabBar.items else { return }
      let images = ["house", "house", "house", "house","house"]
      for item in 0...4 {
        items[item].image = UIImage(systemName: images[item])
      }
// MARK: Changing tint Color
      self.tabBar.tintColor = .orange
    }
}
