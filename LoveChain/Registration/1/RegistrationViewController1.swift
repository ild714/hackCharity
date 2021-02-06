//
//  RegistrationViewController1.swift
//  LoveChain
//
//  Created by Ildar on 2/6/21.
//

import UIKit

class RegistrationViewController1: UIViewController {
    
    @IBOutlet weak var enterToAccount: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        enterToAccount.underline()
    }
    
    
    @IBAction func registrationVC(_ sender: Any) {
        if let registrationVC = RegistrationViewController2.storyboardInstance() {
            self.navigationController?.pushViewController(registrationVC, animated: true)
        }
    }
    @IBAction func enterVC(_ sender: Any) {
        if let enterVC = RegistrationViewController3.storyboardInstance() {
            self.navigationController?.pushViewController(enterVC, animated: true)
        }
    }
    
    static func storyboardInstance() -> RegistrationViewController1? {
        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as? RegistrationViewController1
    }
    
}

