//
//  SceneDelegate.swift
//  TestApp
//
//  Created by Ildar on 2/6/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let winScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: winScene)
        
        let storyboard: UIStoryboard = UIStoryboard(name: "RegistrationViewController1", bundle: nil)
        if let regVC = RegistrationViewController1.storyboardInstance() {
            if let navigationController = storyboard.instantiateInitialViewController() as? UINavigationController {
                navigationController.isNavigationBarHidden = true
                navigationController.viewControllers = [regVC]
                self.window?.rootViewController = navigationController
                self.window?.makeKeyAndVisible()
            }
        }
        
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

