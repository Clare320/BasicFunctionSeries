//
//  NormalTableViewController.swift
//  TableViewForm
//
//  Created by kede on 2018/7/19.
//  Copyright © 2018年 Clare320. All rights reserved.
//

import UIKit

class NormalTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    fileprivate enum Section {
        case input(String, Bool)
        case button(String)
    }
    
    fileprivate lazy var sections = [
        [Section.input("UserName", false),
         Section.input("Password", true),
         Section.input("Password Repeat", true)
        ],
        [Section.button("Sign Up")]
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    let textFieldIdentifier = "TextfieldTableViewCell"
    let buttonIdentifier = "ButtonTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.register(UINib(nibName: "TextfieldTableViewCell", bundle: nil), forCellReuseIdentifier: "TextfieldTableViewCell")
        tableView.register(UINib(nibName: "ButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "ButtonTableViewCell")
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section][indexPath.row]
        switch section {
            // 模式匹配
        case let .input(placeholder, isSecureTextEntry):
            let cell = tableView.dequeueReusableCell(withIdentifier: textFieldIdentifier, for: indexPath) as! TextfieldTableViewCell
            cell.attribute = (placeholder, isSecureTextEntry)
            return cell
        case let .button(title):
            let cell = tableView.dequeueReusableCell(withIdentifier: buttonIdentifier, for: indexPath) as! ButtonTableViewCell
            cell.title = title
            return cell
        }
    }

}
