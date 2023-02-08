//
//  MoreElementsInCellVC.swift
//  SnapExplore
//
//  Created by Afir Thes on 08.02.2023.
//

import UIKit

class MoreElementsCell: UITableViewCell {
    static var reuseId = "cell"

    let contentImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "dummy100")!)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    let imageNameLabel: UILabel = {
        let lable = UILabel()

        lable.text = "Это замечательнкая картинка"
        lable.font = UIFont.systemFont(ofSize: 22)

        return lable
    }()

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    private func setupUI() {
        contentView.addSubview(contentImageView)
        contentImageView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(contentImageView.snp.width)
        }

        contentView.addSubview(imageNameLabel)
        imageNameLabel.snp.makeConstraints { make in
            make.top.equalTo(contentImageView.snp.bottom)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }

    public func setImage() {}
}

class MoreElementsInCellVC: UITableViewController {
    lazy var contentImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "dummy100")!)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(MoreElementsCell.self, forCellReuseIdentifier: ImateTableViewCell.reuseId)
    }

    // MARK: - Table view data source

    override func numberOfSections(in _: UITableView) -> Int {
        1
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImateTableViewCell.reuseId, for: indexPath)

        return cell
    }
}
