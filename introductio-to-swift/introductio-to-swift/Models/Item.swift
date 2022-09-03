//
//  Item.swift
//  introductio-to-swift
//
//  Created by Franklin Carvalho on 03/09/22.
//

import UIKit

class Item: NSObject {
    var nameItem:String
    var calories:Double
        
    init(nameItemDeclaration:String, caloriesDeclaration:Double) {
        self.nameItem = nameItemDeclaration
        self.calories = caloriesDeclaration
    }
}
