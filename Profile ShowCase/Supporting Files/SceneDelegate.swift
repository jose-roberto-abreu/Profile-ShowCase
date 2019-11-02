//
//  SceneDelegate.swift
//  Profile ShowCase
//
//  Created by Roberto Abreu on 11/2/19.
//  Copyright © 2019 homeappzz. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private var customerCoordinator = CustomerCoordinator()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        customerCoordinator.setupRootViewController()
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = customerCoordinator.rootViewController
        window?.makeKeyAndVisible()
    }

}

