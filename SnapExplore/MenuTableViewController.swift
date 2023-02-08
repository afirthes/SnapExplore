//
//  MenuTableViewController.swift
//  SnapExplore
//
//  Created by Afir Thes on 08.02.2023.
//

import UIKit

struct MenuItem {
    let description: String
    let controller: UIViewController
}

class MenuTableViewController: UITableViewController {
    let controllers = [
        MenuItem(description: "Смотрим что творится с картинкой в таблице.",
                 controller: ImageInTableViewVC()),
        MenuItem(description: "Убеждаемся что у UIImageView есть intrinsic size",
                 controller: ExploreImagViewIntrinsicSizeViewController()),
        MenuItem(description: "Смена картинки с разным ration по кнопке (хранится в стеке)",
                 controller: ChangeImageRatioByButtonStackViewController()),
        MenuItem(description: "Смена картинки с разным ration по кнопке",
                 controller: ChangeImageRatioByButtonViewController())
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UIKit exmaples"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func numberOfSections(in _: UITableView) -> Int {
        1
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        controllers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let item = controllers[indexPath.row]
        cell.textLabel?.text = item.description
        cell.textLabel?.numberOfLines = 0
        cell.selectionStyle = .none

        cell.accessoryType = .detailDisclosureButton
        return cell
    }

    override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = controllers[indexPath.row]
        navigationController?.pushViewController(item.controller, animated: true)
    }
}
