//
//  RegistrationViewController2.swift
//  LoveChain
//
//  Created by Ildar on 2/7/21.
//

import UIKit

class RegistrationViewController2: UIViewController {
    
    @IBOutlet weak var enter: UIButton!
    var pickerData = ["Участник","Партнер","Создатель доброго дела"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        enter.underline()
    }
    
    @IBAction func register(_ sender: Any) {
        if let enter = CollectionViewController.storyboardInstance() {
            self.navigationController?.pushViewController(enter, animated: true)
        }
    }
    @IBAction func enter(_ sender: Any) {
        if let enter = CollectionViewController.storyboardInstance() {
            self.navigationController?.pushViewController(enter, animated: true)
        }
    }
    static func storyboardInstance() -> RegistrationViewController2? {
        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as? RegistrationViewController2
    }

    @IBAction func enterVC(_ sender: Any) {
        if let enterVC = RegistrationViewController3.storyboardInstance() {
            self.navigationController?.pushViewController(enterVC, animated: true)
        }
    }
}
