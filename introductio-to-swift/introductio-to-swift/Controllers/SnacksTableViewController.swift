//
//  SnacksTableViewController.swift
//  introductio-to-swift
//
//  Created by Franklin Carvalho on 17/09/22.
//

import Foundation
import UIKit

class SnackTableViewController: UITableViewController, AddSnackDelegate{
    var snacks: [Snack] = [Snack(nameInit: "fish", happynesInit: 8),
                           Snack(nameInit: "sushi", happynesInit: 7),
                           Snack(nameInit: "temaki", happynesInit: 6)]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snacks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let localSnack: Snack = snacks[indexPath.row]
        cell.textLabel?.text = localSnack.name
        return cell
    }
    
    func add(_ snackIn:Snack){
        snacks.append(snackIn)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "add" {
            if let  viewController = segue.destination as? ViewController{
                viewController.delegate = self
            }
        }
        
    }
    
}
