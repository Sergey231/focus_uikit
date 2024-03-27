//
//  AuthorisationViewController.swift
//  Focus_UIKit
//
//  Created by Sergey Borovikov on 24.03.2024.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

final class AuthorisationViewController: UIViewController {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Authorisation"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emojiLabel: UILabel = {
        let label = UILabel()
        label.text = "🔑"
        label.font = UIFont.systemFont(ofSize: 72)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var loginButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Login"
        config.buttonSize = .large
        config.cornerStyle = .large
        let button = UIButton(configuration: config)
        return button
    }()
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createUI()
        configure()
    }
    
    private func createUI() {
       
        view.addSubview(label)
        view.addSubview(emojiLabel)
        view.addSubview(loginButton)
        
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        emojiLabel.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(32)
        }
    }
    
    private func configure() {
        
//        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        loginButton.rx.tap
            .debug("🛠️")
            .subscribe()
            .disposed(by: disposeBag)
    }
    
//    @objc private func loginButtonTapped() {
//        print("🛠️ loginButtonTapped")
//    }
}
