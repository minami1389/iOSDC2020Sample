//
//  HomeworkDetailViewController.swift
//  iOSDC2020Sample
//
//  Created by Minami Baba on 2020/08/10.
//  Copyright © 2020 minami1389. All rights reserved.
//

import UIKit

class HomeworkDetailViewController: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    private var homework: Homework!
    private var currentUser: User!
    
    static func get(homework: Homework, currentUser: User) -> HomeworkDetailViewController {
        let vc = UIStoryboard(name: "HomeworkDetail", bundle: nil).instantiateInitialViewController() as! HomeworkDetailViewController
        vc.homework = homework
        vc.currentUser = currentUser
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = homework.title
        descriptionLabel.text = homework.description
        
        completeButton.isHidden = !(currentUser is StudentUser)
    }
    
    @IBAction func onTapCompleteButton(_ sender: Any) {
        guard let student = currentUser as? StudentUser else {
            fatalError("生徒以外がこのボタンを押すことは出来ません")
        }
        
        APIClient.shared.completeHomework(student: student, homework: homework) { [unowned self] in
            self.navigationController?.popViewController(animated: true)
        }
    }

}
