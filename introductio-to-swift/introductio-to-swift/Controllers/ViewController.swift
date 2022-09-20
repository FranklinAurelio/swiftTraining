//
//  ViewController.swift
//  introductio-to-swift
//
//  Created by Franklin Carvalho on 23/08/22.
//

import UIKit

protocol AddSnackDelegate{
    func add(_ snackIn:Snack)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddItemDelegate {
 

    //MARK: - Atributos
    var delegate: AddSnackDelegate?
    var itensMock:[String] = ["Shoyo","Pepper", "Salt", "Sugar" ]
    
    var itens:[Item] = [Item(nameItemDeclaration: "Shoyo", caloriesDeclaration: 13),
                        Item(nameItemDeclaration: "Pepper", caloriesDeclaration: 5.8),
                        Item(nameItemDeclaration: "Salt", caloriesDeclaration: 12),
                        Item(nameItemDeclaration: "Sugar", caloriesDeclaration: 40)]
    
    var selectedItens: [Item] = []
    
    //MARK: - IBOutlets
    @IBOutlet var name:UITextField?
    @IBOutlet var happiness:UITextField?
    @IBOutlet weak var addItemTableView: UITableView?
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        let buttonAddItem: UIBarButtonItem = UIBarButtonItem(title: "Add Item", style: .plain, target: self, action: #selector(AddItenButton))
        navigationItem.rightBarButtonItem = buttonAddItem
    }
    
    @objc func AddItenButton(){
        let addItensViewController = AddItensViewController(delegate: self)
        navigationController?.pushViewController(addItensViewController, animated: true)
    }
    
    func add(_ item: Item) {
        itens.append(item)
        addItemTableView?.reloadData()
    }
    
    //MARK: - UItableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itensMock.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellTableView1: UITableViewCell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let itenView: Item = itens[indexPath.row]
        cellTableView1.textLabel?.text = itenView.nameItem
        return cellTableView1
    }
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cellAtTableView = tableView.cellForRow(at: indexPath) else {return}
        
        if cellAtTableView.accessoryType == .none{
            cellAtTableView.accessoryType = .checkmark
            selectedItens.append(itens[indexPath.row])
        }
        else{
            cellAtTableView.accessoryType = .none
            
            let selectedItemRemove = itens[indexPath.row]
            guard let position = selectedItens.firstIndex(of: selectedItemRemove) else {return}
            selectedItens.remove(at: position )
            
        }
        
    }
    
    //MARK: - IBActions
    @IBAction func adictionar(){
        
//        if let snackName = name?.text, let happyValue = happiness?.text{
//            let alimento:String = snackName
//            if let nota:Int = Int(happyValue){
//                let snack = Snack(nameInit: alimento, happynesInit: nota)
//
//                print("O almento \(snack.name) foi classificado como \(snack.happynes) ")
//            }else{
//                print("Erro ao cirar refeição")
//            }
//
//
//        }
        guard let snackName = name?.text else{
            return
        }
        guard let happyValue = happiness?.text, let happy = Int(happyValue) else{
            return
        }
        let snack = Snack(nameInit: snackName, happynesInit: happy, itensInit: selectedItens)
        print("O almento \(snack.name) foi classificado como \(snack.happynes) ")
        
        delegate?.add(snack)
        
        navigationController?.popViewController(animated: true)
    }


}

