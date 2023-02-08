//
//  ExploreImagViewIntrinsicSizeViewController.swift
//  SnapExplore
//
//  Created by Afir Thes on 08.02.2023.
//

import UIKit

class ExploreImagViewIntrinsicSizeViewController: UIViewController {
    let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "dummy"))

        return imageView
    }()

    let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemGray3
        label.textColor = .black
        label.text = "Просто текст"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan

        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.left.top.equalTo(view.safeAreaLayoutGuide)
        }

        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.left.equalTo(imageView.snp.right)
            make.right.equalTo(view.snp.right)
            make.centerY.equalTo(imageView.snp.centerY)
        }
    }
}
