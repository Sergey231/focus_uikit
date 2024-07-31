//
//  StartScreenViewController.swift
//  Focus_UIKit
//
//  Created by Sergey Borovikov on 24.03.2024.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class StartScreenViewController: UIViewController {
    
    private let viewModel = ViewModel()
    private let disposeBag = DisposeBag()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Start Screen"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emojiLabel: UILabel = {
        let label = UILabel()
        label.text = "🚀"
        label.font = .systemFont(ofSize: 72)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        createUI()
        configure()
    }
    
    // MARK: Create UI
    
    private func createUI() {
        view.addSubview(label)
        view.addSubview(emojiLabel)
        
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        emojiLabel.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
    }
    
    // MARK: Configure
    
    private func configure() {
        
        let output = viewModel.configure()
        
        output.isLogined
            .drive(onNext: { isLogined in
                if isLogined {
                    AppFlow.shared.steps.accept(AppStep.homeFlow)
                } else {
                    AppFlow.shared.steps.accept(AppStep.authorizationFlow)
                }
            })
            .disposed(by: disposeBag)
    }
}

#if DEBUG
@available(iOS 17.0, *)
#Preview {
    StartScreenViewController()
}
#endif
