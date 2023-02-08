//
//  StackInTableCellVC.swift
//  SnapExplore
//
//  Created by Afir Thes on 08.02.2023.
//

import UIKit

class StackInCell: UITableViewCell {
    static var reuseId = "cell"

    var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = 0
        return stack
    }()

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
        contentView.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        stack.addArrangedSubview(contentImageView)
        stack.addArrangedSubview(imageNameLabel)
    }

    public func setImage() {}
}

class StackInTableCellVC: UITableViewController {
    lazy var contentImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "dummy100")!)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(StackInCell.self, forCellReuseIdentifier: ImateTableViewCell.reuseId)
    }

    // MARK: - Table view data source

    override func numberOfSections(in _: UITableView) -> Int {
        1
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImateTableViewCell.reuseId, for: indexPath) as! StackInCell
        cell.contentImageView.image = UIImage(named: "dummy\(50 * (indexPath.row + 1))")
        return cell
    }
}
