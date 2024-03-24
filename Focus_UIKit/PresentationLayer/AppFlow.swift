//
//  AppFlow.swift
//  Focus_UIKit
//
//  Created by Sergey Borovikov on 24.03.2024.
//

import RxFlow
import UIKit
import RxCocoa

enum AppStep: Step {
    case authorizationFlow
    case homeFlow
    case startingScreen
}

final class AppFlow: Flow, Stepper {
    
    public static let shared = AppFlow()
    
    private let rootViewController: UINavigationController
    
    init() {
        let rootViewController = UINavigationController()
        // Here you can set up the rootViewController
        self.rootViewController = rootViewController
    }
    
    var root: Presentable {
        rootViewController
    }
    
    let steps = PublishRelay<Step>()
    let initialStep: Step = AppStep.startingScreen
    
    func navigate(to step: RxFlow.Step) -> RxFlow.FlowContributors {
        guard let step = step as? AppStep else { return .none }
        
        switch step {
        case .startingScreen:
            return navigateToStartingScreen()
        case .authorizationFlow:
            return navigateToAuthoricationFlow()
        case .homeFlow:
            return navigateToMainFlow()
        }
    }
    
    private func navigateToStartingScreen() -> FlowContributors {
        let startScreenViewController = StartScreenViewController()
        rootViewController.viewControllers.append(startScreenViewController)
        return .one(
            flowContributor: .contribute(
                withNextPresentable: startScreenViewController,
                withNextStepper: self
            )
        )
    }
    
    private func navigateToAuthoricationFlow() -> FlowContributors {
        
        return .none
    }
    
    private func navigateToMainFlow() -> FlowContributors {
        
        return .none
    }
}
