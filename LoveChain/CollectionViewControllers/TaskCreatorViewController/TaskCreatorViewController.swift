//
//  TaskCreatorViewController.swift
//  LoveChain
//
//  Created by Ildar on 2/7/21.
//

import UIKit
import SideMenu

protocol CreateTask:class {
    func create()
}

class TaskCreatorViewController: UIViewController {

//    private var menu: SideMenuNavigationController?
    weak var delegate: CreateTask?
    @IBOutlet weak var textField: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.layer.cornerRadius = 10
        self.navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .plain, target: self, action: #selector(saveAndClose))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Отменить", style: .plain, target: self, action: #selector(backVC))
       
    }
    
    @objc func backVC() {
        self.navigationController?.popViewController(animated: true)
    }

    @objc func saveAndClose() {
        if let cabinetVC = CollectionViewController.storyboardInstance() {
            self.navigationController?.pushViewController(cabinetVC, animated: true)
            cabinetVC.newTask = self.textField.text
            cabinetVC.create()
        }
        
    }
    
    static func storyboardInstance() -> TaskCreatorViewController? {
        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as? TaskCreatorViewController
    }
   
}
