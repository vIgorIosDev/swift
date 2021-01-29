import UIKit

//1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.

enum WarehouseError:Error {
    case invalidSelection
    case outOfStock
}

class Warehouse {
    private var productsInStock = [
        "Холодильник": 30,
        "Телевизор": 250,
        "Телефон": 400,
        "Кондиционер": 0
    ]
    func remains(goods name: String) -> (Int?,WarehouseError?) {
        
        guard let remainsOfGood = productsInStock[name] else {
            return (nil, WarehouseError.invalidSelection)
        }
        if remainsOfGood == 0 {
            return (nil, WarehouseError.outOfStock)
        }
        return (remainsOfGood, nil)
    }
}
var myWarehouse = Warehouse()
myWarehouse.remains(goods: "Холодильник")
myWarehouse.remains(goods: "Шкаф")
myWarehouse.remains(goods: "Кондиционер")

//2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.

enum RefrigeratorError: Error {
    case notEnoughVolume(Int)
    case alreadyOpen
    case outOfFood
}
class Refrigerator {
    var isOpen: Bool = false
    var filledVolume: Int = 0
    let fullVolume: Int = 200
    
    func addFood(foodVolume: Int) throws -> Int {
        guard filledVolume + foodVolume <= fullVolume else {
            throw RefrigeratorError.notEnoughVolume(filledVolume)
        }
        filledVolume  = filledVolume + foodVolume
        return filledVolume
    }
    func takeFood(foodVolume: Int) throws -> Int {
        guard filledVolume - foodVolume >= 0 else {
            throw RefrigeratorError.outOfFood
        }
        filledVolume  = filledVolume - foodVolume
        return filledVolume
    }
    func openTheDoor() throws -> Bool {
        guard !isOpen else {
            throw RefrigeratorError.alreadyOpen
        }
        isOpen = true
        return true
    }
}

var myRefrigerator = Refrigerator()
do {
    try myRefrigerator.openTheDoor()
} catch let error{
    print(error)
}
do {
    try myRefrigerator.openTheDoor()
} catch let error{
    print(error)
}
do {
    try myRefrigerator.addFood(foodVolume: 205)
} catch let error{
    print(error)
}
do {
    try myRefrigerator.takeFood(foodVolume: 205)
} catch let error{
    print(error)
}
