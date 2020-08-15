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
        let viewControllers: [UIViewController] = [
            UINavigationController(rootViewController: StudentListViewController.get()),
            UINavigationController(rootViewController: SupportViewController.get())
        ]
        
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers(viewControllers, animated: false)
        tabBarController.modalPresentationStyle = .fullScreen
        
        present(tabBarController, animated: true, completion: nil)
    }
    
}

