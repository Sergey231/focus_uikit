//
//  MainFlow.swift
//  Focus_UIKit
//
//  Created by Sergey Borovikov on 24.03.2024.
//


import RxFlow
import RxCocoa
import UIKit

enum MainStep: Step {
    case authorizationFlow
    case homeScreen
}

final class MainFlow: Flow, Stepper {
    
    let steps = PublishRelay<Step>()
    let initialStep = MainStep.homeScreen

    var root: Presentable {
        rootViewController
    }
    
    private let rootViewController: UINavigationController
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? MainStep else { return .none }
        
        switch step {
        case .homeScreen:
            return navigateToHomeScreen()
        case .authorizationFlow:
            return navigateToAuthorizationFlow()
        }
    }
    
    private func navigateToHomeScreen() -> FlowContributors {
        let homeViewController = HomeViewController()
        rootViewController.viewControllers.append(homeViewController)
        return .one(
            flowContributor: .contribute(
                withNextPresentable: homeViewController,
                withNextStepper: self
            )
        )
    }
    
    private func navigateToAuthorizationFlow() -> FlowContributors {
        .one(
            flowContributor: .contribute(
                withNextPresentable: AppFlow.shared,
                withNextStepper: OneStepper(withSingleStep: AppStep.authorizationFlow)
            )
        )
    }
}

