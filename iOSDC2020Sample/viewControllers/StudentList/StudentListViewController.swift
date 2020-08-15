//
//  StudentListViewController.swift
//  iOSDC2020Sample
//
//  Created by Minami Baba on 2020/08/10.
//  Copyright © 2020 minami1389. All rights reserved.
//

import UIKit

class StudentListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var students: [StudentUser] = []
    
    static func get() -> StudentListViewController {
        return UIStoryboard(name: "StudentList", bundle: nil).instantiateInitialViewController() as! StudentListViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIClient.shared.fetchStudents { [unowned self] (students) in
            self.students = students
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let student = students[indexPath.row]
        cell.textLabel?.text = student.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let student = students[indexPath.row]
        let vc = HomeworkListViewController.get(student: student)
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
