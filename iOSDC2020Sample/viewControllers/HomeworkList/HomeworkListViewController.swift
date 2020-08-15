//
//  HomeworkListViewController.swift
//  iOSDC2020Sample
//
//  Created by Minami Baba on 2020/08/10.
//  Copyright © 2020 minami1389. All rights reserved.
//

import UIKit

class HomeworkListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var student: StudentUser!
    private var currentUser: User!
    private var homeworks: [Homework] = []
    
    static func get(student: StudentUser, currentUser: User) -> HomeworkListViewController {
        let vc = UIStoryboard(name: "HomeworkList", bundle: nil).instantiateInitialViewController() as! HomeworkListViewController
        vc.student = student
        vc.currentUser = currentUser
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = student.name
        
        if currentUser is TeacherUser {
            let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onTapAddButton))
            self.navigationItem.setRightBarButton(addButton, animated: false)
        }
    }
    
    @objc func onTapAddButton() {
        guard let teacher = currentUser as? TeacherUser else {
            fatalError("先生以外がこのボタンを押すことは出来ません")
        }
        
        let vc = CreateHomeworkViewController.get(student: student, teacher: teacher)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        APIClient.shared.fetchHomeworks(for: student) { [unowned self] (homeworks) in
            self.homeworks = homeworks
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeworks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let homework = homeworks[indexPath.row]
        cell.textLabel?.text = homework.title
        cell.accessoryType = homework.isCompleted ? .checkmark : .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let homework = homeworks[indexPath.row]
        let vc = HomeworkDetailViewController.get(homework: homework, currentUser: currentUser)
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
