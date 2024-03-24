//
//  StartScreenViewModel.swift
//  Focus_UIKit
//
//  Created by Sergey Borovikov on 24.03.2024.
//

import UIKit
import RxSwift
import RxCocoa

extension StartScreenViewController {
    
    class ViewModel {
        
        struct Output {
            let isLogined: Driver<Bool>
        }
        
        func configure() -> Output {
            
            return Output(isLogined: .just(false))
        }
    }
}
