import UIKit

class Snack{
    var name:String
    var happynes:String
    var itens:Array<Item> = []
    
    init(nameInit:String, happynesInit:String) {
        self.name = nameInit
        self.happynes = happynesInit
    }
    
    func sumCalories() -> Double {
        var sum = 0.0
        for item in itens{
            sum += item.calories
        }
        return sum
    }
}

let snackListening = Snack(nameInit: "RICE", happynesInit: "5")

class Item{
    var nameItem:String
    var calories:Double
    
    init(nameItemDeclaration:String, caloriesDeclaration:Double) {
        self.nameItem = nameItemDeclaration
        self.calories = caloriesDeclaration
    }
}
print(snackListening.happynes)

let rice = Item(nameItemDeclaration: "Rice", caloriesDeclaration: 20.0)
let bean = Item(nameItemDeclaration: "Bean", caloriesDeclaration: 40.0)
let meat = Item(nameItemDeclaration: "Meat", caloriesDeclaration: 100.0)

snackListening.itens.append(rice)
snackListening.itens.append(bean)
snackListening.itens.append(meat)

if let firstItem = snackListening.itens.first{
    print(firstItem.nameItem)
}

print(snackListening.sumCalories())
