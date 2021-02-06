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
