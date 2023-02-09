//
//  HorizontalStackExperiment.swift
//  SnapExplore
//
//  Created by Afir Thes on 09.02.2023.
//

import SnapKit
import UIKit

class HorizontalStackExperiment: UIViewController {
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .red.withAlphaComponent(0.2)
        view.layer.cornerRadius = 4
        return view
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 3
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }

    private func initialize() {
        view.backgroundColor = .systemBackground
        view.addSubview(containerView)
        
        containerView.addSubview(stackView)
        
        for _ in 0...6 {
            let view = UIView()
            view.backgroundColor = .blue.withAlphaComponent(0.2)
            view.layer.cornerRadius = 4
            stackView.addArrangedSubview(view)
            
            view.snp.makeConstraints { make in
                make.height.equalTo(view.snp.width)
            }
        }
        
        containerView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}
