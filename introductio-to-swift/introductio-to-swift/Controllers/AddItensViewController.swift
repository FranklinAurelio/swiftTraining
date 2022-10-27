//
//  AddItensViewController.swift
//  introductio-to-swift
//
//  Created by Franklin Carvalho on 20/09/22.
//

import UIKit


protocol AddItemDelegate{
    func add(_ item: Item)
}

class AddItensViewController: UIViewController {

    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - Atributos
    var delegate: AddItemDelegate?
    
    init(delegate: AddItemDelegate) {
        super.init(nibName: "AddItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var nameItem: UITextField?
    
    @IBOutlet weak var caloriesItem: UITextField?
    
    // MARK: - IBAction
    @IBAction func popAddItem(_ sender: Any) {
        guard let itemName = nameItem?.text else{ return }
        guard let itemCalorie = caloriesItem?.text, let calorie = Double(itemCalorie) else{return}
        let item: Item = Item(nameItemDeclaration: itemName, caloriesDeclaration: calorie)
        //delegate?.add(item)
        guard let delegateValue = delegate else{
            return
        }
        delegateValue.add(item)
        navigationController?.popViewController(animated: true)
    }
}
