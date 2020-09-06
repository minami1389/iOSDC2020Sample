//
//  StudentListViewController.swift
//  iOSDC2020Sample
//
//  Created by Minami Baba on 2020/08/10.
//  Copyright © 2020 minami1389. All rights reserved.
//

import UIKit

class StudentListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var students: [Student] = []
    
    static func get() -> UIViewController {
        let vc = UIStoryboard(name: "StudentList", bundle: nil).instantiateInitialViewController() as! StudentListViewController
        return UINavigationController(rootViewController: vc)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        APIClient.shared.fetchStudents { [unowned self] (students) in
            self.students = students
            self.tableView.reloadData()
        }
    }
    
}

extension StudentListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let student = students[indexPath.row]
        cell.textLabel?.text = student.name
        return cell
    }
}
