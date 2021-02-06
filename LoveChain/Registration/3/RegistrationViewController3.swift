//
//  RegistrationViewController3.swift
//  LoveChain
//
//  Created by Ildar on 2/7/21.
//

import UIKit

class RegistrationViewController3: UIViewController {

    
    @IBOutlet weak var register: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        register.underline()
    }
    
    @IBAction func registerButton(_ sender: Any) {
        if let enterVC = RegistrationViewController2.storyboardInstance() {
            self.navigationController?.pushViewController(enterVC, animated: true)
        }
    }
    
    static func storyboardInstance() -> RegistrationViewController3? {
        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as? RegistrationViewController3
    }
    
}
