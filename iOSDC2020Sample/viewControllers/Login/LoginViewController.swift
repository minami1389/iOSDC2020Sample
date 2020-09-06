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
        APIClient.shared.login { [unowned self] in
            #if STUDENT
            let viewControllers = [
                HomeworkListViewController.get()
            ]
            #elseif TEACHER
            let viewControllers = [
                HomeworkListViewController.get(),
                StudentListViewController.get()
            ]
            #endif
            
            let tabCon = UITabBarController()
            tabCon.setViewControllers(viewControllers, animated: false)
            tabCon.modalPresentationStyle = .fullScreen
            
            self.present(tabCon, animated: true, completion: nil)
        }
    }

}

