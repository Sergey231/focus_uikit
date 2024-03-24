//
//  StartScreenViewController.swift
//  Focus_UIKit
//
//  Created by Sergey Borovikov on 24.03.2024.
//

import UIKit
import SnapKit

final class StartScreenViewController: UIViewController {
    
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
        
        view.backgroundColor = .white
        createUI()
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
}
