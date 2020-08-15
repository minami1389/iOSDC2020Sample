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
        
        loginButton.setTitle(UserType.current.loginButtonTitle, for: .normal)
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
        switch user {
        case let student as StudentUser:
            return [
                UINavigationController(rootViewController: HomeworkListViewController.get(student: student, currentUser: student)),
                UINavigationController(rootViewController: SupportViewController.get(currentUser: student))
            ]
        case let teacher as TeacherUser:
            return [
                UINavigationController(rootViewController: StudentListViewController.get(teacher: teacher)),
                UINavigationController(rootViewController: SupportViewController.get(currentUser: teacher))
            ]
        default:
            fatalError("")
        }
        
    }
    
}

