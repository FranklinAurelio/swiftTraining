//
//  ViewController.swift
//  table-view-swift
//
//  Created by Franklin Carvalho on 12/09/22.
//

import UIKit

class ViewController: UITableViewController {
    
    let snacks:[String] = ["Rice", "Orange", "Beef"]

    override func viewDidLoad() {
        super.viewDidLoad()
        print("load table view controller success")
    }
    
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snacks.count

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let snackRender: String = snacks[indexPath.row]
        cell.textLabel?.text = snackRender
        return cell
    }

}

