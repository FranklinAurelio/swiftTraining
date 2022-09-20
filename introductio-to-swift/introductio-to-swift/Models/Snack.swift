//
//  Snack.swift
//  introductio-to-swift
//
//  Created by Franklin Carvalho on 03/09/22.
//

import UIKit

class Snack: NSObject {
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
}
