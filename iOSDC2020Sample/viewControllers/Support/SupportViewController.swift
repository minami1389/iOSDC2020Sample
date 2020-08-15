//
//  SupportViewController.swift
//  iOSDC2020Sample
//
//  Created by Minami Baba on 2020/08/10.
//  Copyright © 2020 minami1389. All rights reserved.
//

import UIKit

class SupportViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let menus: [SupportMenu] = [
        SupportMenu(title: "通知設定"),
        SupportMenu(title: "夏休みのスケジュール"),
        SupportMenu(title: "課題作成時のルール"),
        SupportMenu(title: "成績管理表")
    ]
    
    static func get() -> SupportViewController {
        return UIStoryboard(name: "Support", bundle: nil).instantiateInitialViewController() as! SupportViewController
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let menu = menus[indexPath.row]
        cell.textLabel?.text = menu.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
