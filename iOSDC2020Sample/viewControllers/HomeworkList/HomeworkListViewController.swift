//
//  HomeworkListViewController.swift
//  iOSDC2020Sample
//
//  Created by Minami Baba on 2020/08/10.
//  Copyright © 2020 minami1389. All rights reserved.
//

import UIKit

class HomeworkListViewController: UIViewController {
    
    @IBOutlet weak var addHomeworkButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    private var homeworks: [Homework] = []
    
    static func get() -> UIViewController {
        let vc = UIStoryboard(name: "HomeworkList", bundle: nil).instantiateInitialViewController() as! HomeworkListViewController
        return UINavigationController(rootViewController: vc)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        #if STUDENT
        addHomeworkButton.isHidden = true
        #endif
    }
    
    @IBAction func onTapAddButton(_ sender: Any) {
        let vc = CreateHomeworkViewController.get()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
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
