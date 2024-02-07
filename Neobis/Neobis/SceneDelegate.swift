//
//  SceneDelegate.swift
//  Neobis
//
//  Created by Людмила Долонтаева on 2024-02-06.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions) {
      guard let windowScene = (scene as? UIWindowScene) else { return }
      let loginVC = LoginViewController()
      let window = UIWindow(windowScene: windowScene)
      let navigationVC = UINavigationController(rootViewController: loginVC) 
      navigationVC.setNavigationBarHidden(true, animated: false)
      window.rootViewController = navigationVC

      self.window = window
      window.makeKeyAndVisible()
  }
}

