//
//  CreateHomeworkViewController.swift
//  iOSDC2020Sample
//
//  Created by Minami Baba on 2020/08/10.
//  Copyright © 2020 minami1389. All rights reserved.
//

import UIKit

class CreateHomeworkViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    static func get() -> UIViewController {
        let vc = UIStoryboard(name: "CreateHomework", bundle: nil).instantiateInitialViewController() as! CreateHomeworkViewController
        return UINavigationController(rootViewController: vc)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let closeButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(onTapCloseButton))
        self.navigationItem.setLeftBarButton(closeButton, animated: true)
    }
    
    @objc func onTapCloseButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onTapAddButton(_ sender: Any) {
        APIClient.shared.addHomework(title: titleTextField.text!) { [unowned self] in
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
