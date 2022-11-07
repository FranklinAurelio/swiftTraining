//
//  RemoveSnackViewController.swift
//  introductio-to-swift
//
//  Created by Franklin Carvalho on 07/11/22.
//

import Foundation
import UIKit

class RemoveSnackViewController{
    
    let controller:UIViewController
    init(controller:UIViewController){
        self.controller = controller
    }
    
    func show(_ longPressSnacks:Snack, handler: @escaping (UIAlertAction)->Void){
        let alertSnack: UIAlertController = UIAlertController(title: longPressSnacks.name, message: longPressSnacks.details(), preferredStyle: .alert)
        let buttonCancel: UIAlertAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        let buttonRemove: UIAlertAction = UIAlertAction(title: "remove", style: .destructive, handler: handler)
        alertSnack.addAction(buttonRemove)
        alertSnack.addAction(buttonCancel)
        controller.present(alertSnack, animated: true, completion: nil)
        
    }
}
