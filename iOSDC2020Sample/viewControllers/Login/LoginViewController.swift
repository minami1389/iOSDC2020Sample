//
//  ViewController.swift
//  iOSDC2020Sample
//
//  Created by Minami Baba on 2020/07/26.
//  Copyright © 2020 minami1389. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBAction func onTapLoginButton(_ sender: Any) {
        APIClient.shared.login { [unowned self] (currentAccount) in
            let viewControllers = { () -> [UIViewController] in
                switch currentAccount {
                case let currentAccount as StudentAccount:
                    return [
                        HomeworkListViewController.get(currentAccount: currentAccount)
                    ]
                case let currentAccount as TeacherAccount:
                    return [
                        StudentListViewController.get(currentAccount: currentAccount),
                        HomeworkListViewController.get(currentAccount: currentAccount)
                    ]
                default:
                    fatalError("")
                }
            }()
            
            let tabCon = UITabBarController()
            tabCon.setViewControllers(viewControllers, animated: false)
            tabCon.modalPresentationStyle = .fullScreen
            
            self.present(tabCon, animated: true, completion: nil)
        }
    }

}

