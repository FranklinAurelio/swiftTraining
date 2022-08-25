//
//  ViewController.swift
//  introductio-to-swift
//
//  Created by Franklin Carvalho on 23/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var name:UITextField!
    @IBOutlet var happiness:UITextField!

    @IBAction func adictionar(){
        let alimento:String = name.text!
        let nota:String = happiness.text!
        print("O almento \(alimento) foi classificado como \(nota) ")
    }


}

