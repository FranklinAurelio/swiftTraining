//
//  Snack.swift
//  introductio-to-swift
//
//  Created by Franklin Carvalho on 03/09/22.
//

import UIKit

class Snack: NSObject, NSCoding {
    var name:String
    var happynes:Int
    var itens:Array<Item> = []
       
    init(nameInit:String, happynesInit:Int, itensInit:[Item] = []) {
        self.name = nameInit
        self.happynes = happynesInit
        self.itens = itensInit
    }
       
    func sumCalories() -> Double {
        var sum = 0.0
        for item in itens{
            sum += item.calories
        }
        return sum
    }
    
    func details() -> String{
        var message = "happyness \(happynes)"
        for item in itens{
            message += ", \(item.nameItem) - calories:  \(item.calories) "
        }
        return message
    }
    
    //MARK: NSCoding
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(happynes, forKey: "happynes")
        coder.encode(itens, forKey: "itens")
    }
    
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as! String
        happynes = coder.decodeInteger(forKey: "happynes")
        itens = coder.decodeObject(forKey: "itens") as! Array<Item>
    }
}
