import UIKit

var name:String = "pizza"
let happiness:Int = 5
let calories:Double = 112.3

print(name)

let isVegetable:Bool = false

//functions

func foodConsumed(){
    if(isVegetable == false){
        print("O alimento não é um vegetal")
    }
    else{
        print("O alimento é um vegetal")
    }
}

foodConsumed()

func foodConsumedV2( nome:String, calories:Double){
    print("O alimento \(nome) possui \(calories)Kcal")
}

foodConsumedV2(nome: name, calories: calories)

//lists and arrays
let calorie1:Double = 50.55
let calorie2:Double = 60.5
let calorie3:Double = 404.77
let calorie4:Double = 505

let totalCaloeies:[Double] = [50.55, 60.5, 404.77, 505]

for i in 0...3{
    print(totalCaloeies[i])
}

for i in 0 ... totalCaloeies.count-1{
    print(totalCaloeies[i])
}

for calorieIndex in totalCaloeies{
    print(calorieIndex)
}


func allCalories(totalCalorias: [Double]) -> Double{
    var total:Double = 0
    for calories in totalCalorias{
        total += calories
    }
    return total
}


let total = allCalories(totalCalorias: totalCaloeies)
print(total)
