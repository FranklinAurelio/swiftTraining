import UIKit

var name:String = ""
var happiness:String = ""

class Snack{
    var name:String?
    var happiness:String?
}

let snack:Snack = Snack()
snack.name = "Rice"
print(snack.name!)

//other ways to extract value from an optional variable
if snack.name != nil{
    print(snack.name!)
}

if let snackValue = snack.name{
    print(snackValue)
}

func seeSnackName(){
    if let name = snack.name{
        print(name)
    }
    guard let name = snack.name else{
        return
    }
    print(name)
}

seeSnackName()

let number:Int? = Int("5")
print(number)

if let numberValue = number {
    print(numberValue)
}

