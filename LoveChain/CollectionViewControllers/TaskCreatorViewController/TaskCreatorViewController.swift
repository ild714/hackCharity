//
//  TaskCreatorViewController.swift
//  LoveChain
//
//  Created by Ildar on 2/7/21.
//

import UIKit

class TaskCreatorViewController: UIViewController {

    @IBOutlet weak var textField: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.layer.cornerRadius = 20
    }
    

    static func storyboardInstance() -> TaskCreatorViewController? {
        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as? TaskCreatorViewController
    }
   
}
