//
//  SceneDelegate.swift
//  herconomyApp
//
//  Created by Decagon on 04/11/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    let rootViewController = TabBarViewController()
    let navigationController = UINavigationController(rootViewController: rootViewController)
    window = UIWindow(frame: windowScene.coordinateSpace.bounds)
    window?.windowScene = windowScene
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
  }

  func sceneDidDisconnect(_ scene: UIScene) {
   
  }

  func sceneDidBecomeActive(_ scene: UIScene) {
    
  }

  func sceneWillResignActive(_ scene: UIScene) {
    
  }

  func sceneWillEnterForeground(_ scene: UIScene) {
   
  }

  func sceneDidEnterBackground(_ scene: UIScene) {
    
  }


}

