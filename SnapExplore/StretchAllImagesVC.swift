//
//  StretchAllImagesVC.swift
//  SnapExplore
//
//  Created by Afir Thes on 08.02.2023.
//

import UIKit

class StretchedCell: UITableViewCell {
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

        contentImageView.setContentHuggingPriority(.defaultLow, for: .vertical)
        imageNameLabel.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)

        stack.addArrangedSubview(contentImageView)
        contentImageView.snp.makeConstraints { make in
            make.left.equalTo(contentView.snp.left)
            make.right.equalTo(contentView.snp.right)
            make.height.equalTo(contentView.snp.width)
        }
        stack.addArrangedSubview(imageNameLabel)

    }

    public func setupImage(_ image: UIImage?) {
        contentImageView.image = image

        let height = UIScreen.main.bounds.width / image!.getCropRation()

        contentImageView.snp.remakeConstraints { make in
            make.left.equalTo(contentView.snp.left)
            make.right.equalTo(contentView.snp.right)
            make.height.equalTo(height)
        }
    }
}

class StretchAllImagesVC: UITableViewController {
    lazy var contentImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "dummy100")!)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(StretchedCell.self, forCellReuseIdentifier: ImateTableViewCell.reuseId)
    }

    // MARK: - Table view data source

    override func numberOfSections(in _: UITableView) -> Int {
        1
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        5
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StretchedCell.reuseId, for: indexPath) as! StretchedCell

        switch indexPath.row {
        case 0:
            cell.setupImage(UIImage(named: "dummy100"))
        case 1:
            cell.setupImage(UIImage(named: "dummy100x200"))
        case 2:
            cell.setupImage(UIImage(named: "dummy150x200"))
        case 3:
            cell.setupImage(UIImage(named: "pic1"))
        case 4:
            cell.setupImage(UIImage(named: "pic2"))
        default:
            break
        }
        
        cell.selectionStyle = .none

        return cell
    }
}
