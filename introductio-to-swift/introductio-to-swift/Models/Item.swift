//
//  Item.swift
//  introductio-to-swift
//
//  Created by Franklin Carvalho on 03/09/22.
//

import UIKit

class Item: NSObject, NSCoding {

    
    var nameItem:String
    var calories:Double
        
    init(nameItemDeclaration:String, caloriesDeclaration:Double) {
        self.nameItem = nameItemDeclaration
        self.calories = caloriesDeclaration
    }
    
    //MARK: NSCodinf
    func encode(with coder: NSCoder) {
        coder.encode(nameItem, forKey: "nameItem")
        coder.encode(calories, forKey: "calories")
    }
    
    required init?(coder: NSCoder) {
        nameItem = coder.decodeObject(forKey: "nameItem") as! String
        calories =  coder.decodeDouble(forKey: "calories")
    }
}
