//
//  MenuViewController.swift
//  LoveChain
//
//  Created by Ildar on 2/7/21.
//

import UIKit

protocol CloseMenu:class {
    func close()
    func showAllTasks()
    func showTaskCreator()
}

class MenuViewController: UITableViewController {

    weak var delegate: CloseMenu?
    
    var items = ["Личный кабинет","Все заявки","Создать заявку","Выйти из аккаунта"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        multipleTitle()
    }

    func multipleTitle() {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 11.0)
        label.textAlignment = .center
        label.textColor = .black
        label.text = "Открой\nглаза"
        self.navigationItem.titleView = label
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Arial", size: 15)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if indexPath.row == 0 {
            delegate?.close()
        } else if indexPath.row == 1 {
            delegate?.showAllTasks()
        } else if indexPath.row == 2 {
            delegate?.showTaskCreator()
        } else if indexPath.row == 3{
            if let beiginVC = RegistrationViewController1.storyboardInstance() {
                self.navigationController?.pushViewController(beiginVC, animated: true)
                beiginVC.navigationController?.isNavigationBarHidden = true
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

