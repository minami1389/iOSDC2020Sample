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
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    private var student: User!
    
    static func get(student: User, teacher: TeacherUser) -> UIViewController {
        let vc = UIStoryboard(name: "CreateHomework", bundle: nil).instantiateInitialViewController() as! CreateHomeworkViewController
        vc.student = student
        return UINavigationController(rootViewController: vc)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "\(student.name)さんへの課題作成"
        
        let closeButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(onTapCloseButton))
        self.navigationItem.setLeftBarButton(closeButton, animated: true)
    }
    
    @objc func onTapCloseButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onTapAddButton(_ sender: Any) {
        guard let title = titleTextField.text, let description = descriptionTextField.text else {
            return
        }
        
        APIClient.shared.addHomework(for: student, title: title, description: description) { [unowned self] in
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
