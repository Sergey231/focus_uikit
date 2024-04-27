//
//  AuthorisationFlow.swift
//  Focus_UIKit
//
//  Created by Sergey Borovikov on 24.03.2024.
//

import RxFlow
import RxCocoa
import UIKit

enum AuthorisationStep: Step {
    case authorizationScreen
    case mainFlow
}

final class AuthorisationFlow: Flow, Stepper {
    
    let steps = PublishRelay<Step>()
    let initialStep: Step  = AuthorisationStep.authorizationScreen

    var root: Presentable {
        rootViewController
    }
    
    private let rootViewController: UINavigationController
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AuthorisationStep else { return .none }
        
        switch step {
        case .authorizationScreen:
            return navigateToAuthoricationScreen()
        case .mainFlow:
            return navigateToMainFlow()
        }
    }
    
    private func navigateToAuthoricationScreen() -> FlowContributors {
        let authorisationViewController = AuthorisationViewController()
        rootViewController.viewControllers.append(authorisationViewController)
        return .one(
            flowContributor: .contribute(
                withNextPresentable: authorisationViewController,
                withNextStepper: self
            )
        )
    }
    
    private func navigateToMainFlow() -> FlowContributors {
        print("🔴 navigateToMainFlow()")
        return .end(forwardToParentFlowWithStep: AppStep.homeFlow)
    }
}
