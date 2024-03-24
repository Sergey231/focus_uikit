//
//  SceneDelegate.swift
//  Focus_UIKit
//
//  Created by Sergey Borovikov on 24.03.2024.
//

import UIKit
import RxFlow

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var flowCoordinator = FlowCoordinator()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        guard let windowSence = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowSence)
        guard let window = self.window else { return }
        
        let appFlow = AppFlow.shared
        
        let root = AppFlow.shared
        Flows.use(AppFlow.shared, when: .created) { root in
            window.rootViewController = root
            window.makeKeyAndVisible()
        }
        
        flowCoordinator.coordinate(flow: AppFlow.shared, with: AppFlow.shared)
    }
}

