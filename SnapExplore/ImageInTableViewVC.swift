//
//  ImageInTableViewVC.swift
//  SnapExplore
//
//  Created by Afir Thes on 08.02.2023.
//

import UIKit

class ImateTableViewCell: UITableViewCell {
    static var reuseId = "cell"

    let contentImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "dummy")!)
        imageView.contentMode = .scaleAspectFit
        return imageView
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
            make.edges.equalToSuperview()
        }
    }
}

class ImageInTableViewVC: UITableViewController {
    lazy var contentImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "dummy")!)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ImateTableViewCell.self, forCellReuseIdentifier: ImateTableViewCell.reuseId)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        contentImageView.removeFromSuperview()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIApplication.shared.keyWindow?.addSubview(contentImageView)

        //        view.addSubview(contentImageView)
        contentImageView.snp.makeConstraints { make in
            make.right.bottom.equalToSuperview().inset(50)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in _: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        1
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImateTableViewCell.reuseId, for: indexPath)

        return cell
    }

}
