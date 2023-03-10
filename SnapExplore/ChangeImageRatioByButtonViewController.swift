//
//  ViewController.swift
//  SnapExplore
//
//  Created by Afir Thes on 07.02.2023.
//

import SnapKit
import UIKit

class ChangeImageRatioByButtonViewController: UIViewController {
    let image1 = UIImage(named: "pic1")
    let image2 = UIImage(named: "pic2")

    lazy var topImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = image1
        imageView.snp.makeConstraints { make in
            make.height.equalTo(UIScreen.main.bounds.width / imageView.image!.getCropRation())
            make.width.equalTo(UIScreen.main.bounds.width)
        }
        return imageView
    }()

    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Change image", for: .normal)
        button.configuration = .tinted()
        button.tintColor = .systemBlue
        button.addTarget(self, action: #selector(changeImageTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }

    private func initialize() {
        view.backgroundColor = UIColor(hex: "F4EFE6")

        view.addSubview(topImageView)
        topImageView.snp.makeConstraints { maker in
            maker.top.left.right.equalToSuperview()
        }

        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.top.equalTo(topImageView.snp.bottom).inset(-10)
            make.centerX.equalToSuperview()
        }
    }

    @objc func changeImageTapped() {
        DispatchQueue.main.async { [self] in
            if self.topImageView.image == self.image1 {
                self.topImageView.image = image2
            } else {
                self.topImageView.image = image1
            }

            UIView.animate(withDuration: 10) { [self] in
                self.topImageView.snp.remakeConstraints { make in
                    make.height.equalTo(UIScreen.main.bounds.width / topImageView.image!.getCropRation())
                    make.width.equalTo(UIScreen.main.bounds.width)
                }
            }
        }
    }
}
