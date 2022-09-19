//
//  ViewController.swift
//  introductio-to-swift
//
//  Created by Franklin Carvalho on 23/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var name:UITextField?
    @IBOutlet var happiness:UITextField?
    
    var tableViewController: SnackTableViewController?

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
        let snack = Snack(nameInit: snackName, happynesInit: happy)
        print("O almento \(snack.name) foi classificado como \(snack.happynes) ")
        
        tableViewController?.add(snack)
        
        navigationController?.popViewController(animated: true)
    }


}

