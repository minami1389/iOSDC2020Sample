//
//  HomeworkListViewController.swift
//  iOSDC2020Sample
//
//  Created by Minami Baba on 2020/08/10.
//  Copyright © 2020 minami1389. All rights reserved.
//

import UIKit

class HomeworkListViewController: UIViewController {
    
    @IBOutlet weak var createHomeworkButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    private var homeworks: [Homework] = []
    
    private var currentAccount: Account!
    
    static func get(currentAccount: Account) -> UIViewController {
        let vc = UIStoryboard(name: "HomeworkList", bundle: nil)
            .instantiateInitialViewController() as! HomeworkListViewController
        vc.currentAccount = currentAccount
        return UINavigationController(rootViewController: vc)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        #if STUDENT
        createHomeworkButton.isHidden = true
        #endif
    }
    
    @IBAction func onTapCreateHomeworkButton(_ sender: Any) {
        if let currentAccount = currentAccount as? TeacherAccount {
            let vc = CreateHomeworkViewController.get(currentAccount: currentAccount)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        APIClient.shared.fetchHomeworks() { [unowned self] (homeworks) in
            self.homeworks = homeworks
            self.tableView.reloadData()
        }
    }
    
}

extension HomeworkListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeworks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let homework = homeworks[indexPath.row]
        cell.textLabel?.text = homework.title
        return cell
    }
}
