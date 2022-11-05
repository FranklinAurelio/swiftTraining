//
//  Alert.swift
//  introductio-to-swift
//
//  Created by Franklin Carvalho on 05/11/22.
//

import Foundation
import UIKit

class Alert{
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func showAlert( titleStr:String = "Sorry!", message:String = "Error"){
        let alertError:UIAlertController = UIAlertController(title: titleStr, message: message, preferredStyle: .alert)
        let ok:UIAlertAction = UIAlertAction(title: "Ok", style: .cancel)
        alertError.addAction(ok)
        controller.present(alertError, animated: true)
    }
}
