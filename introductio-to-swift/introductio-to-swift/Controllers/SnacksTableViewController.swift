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
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(showDetails(_:)))
        cell.addGestureRecognizer(longPress)
        
        return cell
    }
    
    @objc func showDetails(_ gesture: UILongPressGestureRecognizer){
        if gesture.state == .began{
            let view = gesture.view as! UITableViewCell
            
            guard let indexPath = tableView.indexPath(for: view) else{
                return
            }
            let longPressSnacks: Snack = snacks[indexPath.row]
            
            RemoveSnackViewController(controller: self).show(longPressSnacks, handler: {
                alert in
                self.snacks.remove(at: indexPath.row)
                self.tableView.reloadData()
            })
           
                // completion is configure action after show alert
            
        }
    }
    
    func add(_ snackIn:Snack){
        snacks.append(snackIn)
        
        guard let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else{ return }
        
        let path = dir.appendingPathExtension("SnacksApplication")
        
        do{
            let data = try NSKeyedArchiver.archivedData(withRootObject: snacks, requiringSecureCoding: false)
            try data.write(to: path)
        }catch{
            print(error.localizedDescription)
        }
        
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
