//
//  ViewController.swift
//  iOSDC2020Sample
//
//  Created by Minami Baba on 2020/07/26.
//  Copyright © 2020 minami1389. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        #if STUDENT
        loginButton.setTitle("生徒用ログイン", for: .normal)
        #elseif TEACHER
        loginButton.setTitle("先生用ログイン", for: .normal)
        #endif
    }

    @IBAction func onTapLoginButton(_ sender: Any) {
        APIClient.shared.login { [unowned self] (user) in
            let viewControllers = self.getViewControllers(user: user)
            
            let tabBarController = UITabBarController()
            tabBarController.setViewControllers(viewControllers, animated: false)
            tabBarController.modalPresentationStyle = .fullScreen
            
            self.present(tabBarController, animated: true, completion: nil)
        }
        
    }
    
    private func getViewControllers(user: User) -> [UIViewController] {
        #if STUDENT
        return [
            UINavigationController(rootViewController: HomeworkListViewController.get(student: user)),
            UINavigationController(rootViewController: SupportViewController.get())
        ]
        #elseif TEACHER
        return [
            UINavigationController(rootViewController: StudentListViewController.get()),
            UINavigationController(rootViewController: SupportViewController.get())
        ]
        #endif
    }
    
}

