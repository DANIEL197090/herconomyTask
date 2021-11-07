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
      
      homeViewController.title = "Home"
      OpportunitiesViewController.title = "Opportunities"
      AddViewController.title = "Add"
      NotificationViewController.title = "Notification"
      EventsViewController.title = "Events"
      
// MARK: Assign viewController to tab Bar
      self.setViewControllers([homeViewController, OpportunitiesViewController,AddViewController, NotificationViewController, EventsViewController], animated: false)
      
      guard let items = self.tabBar.items else { return }
      tabBar.backgroundColor = .white
      tabBar.layer.cornerRadius = 30
      
      let images = ["timelapse", "case", "plus.circle", "bell","calendar"]
      for item in 0...4 {
        items[item].image = UIImage(systemName: images[item])
      }
// MARK: Changing tint Color
      self.tabBar.tintColor = .orange
    }
}
