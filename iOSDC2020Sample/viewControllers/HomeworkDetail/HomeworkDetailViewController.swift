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
    
    static func get(homework: Homework) -> HomeworkDetailViewController {
        let vc = UIStoryboard(name: "HomeworkDetail", bundle: nil).instantiateInitialViewController() as! HomeworkDetailViewController
        vc.homework = homework
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = homework.title
        descriptionLabel.text = homework.description
    }
    
    @IBAction func onTapCompleteButton(_ sender: Any) {
        APIClient.shared.completeHomework(homework: homework) { [unowned self] in
            self.navigationController?.popViewController(animated: true)
        }
    }

}
