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
    
    private var currentAccount: TeacherAccount!
    
    static func get(currentAccount: TeacherAccount) -> UIViewController {
        let vc = UIStoryboard(name: "CreateHomework", bundle: nil)
            .instantiateInitialViewController() as! CreateHomeworkViewController
        vc.currentAccount  = currentAccount
        return UINavigationController(rootViewController: vc)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        #if STUDENT
        fatalError("生徒アプリではこの画面に遷移してはならない")
        #endif
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let closeButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(onTapCloseButton))
        self.navigationItem.setLeftBarButton(closeButton, animated: true)
    }
    
    @objc func onTapCloseButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onTapSaveButton(_ sender: Any) {
        APIClient.shared.createHomework(
            account: currentAccount,
            title: titleTextField.text!
        ) { [unowned self] in
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
}
