//
//  MenuTableViewController.swift
//  SnapExplore
//
//  Created by Afir Thes on 08.02.2023.
//

import UIKit

struct MenuItem {
    let description:String
    let controller:ChangeImageRatioByButtonViewController
}

class MenuTableViewController: UITableViewController {
    
    let controllers = [
        MenuItem(description: "Смена картинки с разным ration по кнопке",
                 controller: ChangeImageRatioByButtonViewController())
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "UIKit exmaples"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = controllers[indexPath.row]
        item.controller.modalPresentationStyle = .fullScreen
        present(item.controller, animated: true)
    }

}
