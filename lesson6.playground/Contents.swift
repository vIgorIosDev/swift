import UIKit


//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.

class Stuck <element>{
    var array: [element] = []
    var count: Int {
        array.count
    }
    init(){}
    func put(_ element: element) -> Void {
        array.append(element)
    }
    //first in first out
    func fifo() -> element {
        array.removeFirst()
    }
    //last in first out
    func lifo() -> element {
        array.removeLast()
    }
}


var stuck1 = Stuck<Int>()
stuck1.put(1)
stuck1.put(2)
stuck1.put(3)
stuck1.put(4)
stuck1.put(1)
stuck1.put(2)
stuck1.put(3)
stuck1.put(4)
stuck1.fifo()
stuck1.lifo()
stuck1.count

//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
extension Stuck {
    func filter(closure: (element) -> Bool ) -> [element] {
        var newArray = [element]()
        for elementArray in self.array {
            if closure(elementArray) {
                newArray.append(elementArray)
            }
        }
        return newArray
    }
    func map(closure: (element) -> element ) -> [element] {
        var newArray = [element]()
        for elementArray in self.array {
                newArray.append(closure(elementArray))
        }
        return newArray
    }

}

let even: (Int) -> Bool = { (element: Int) -> Bool in
    return element % 2 == 0
}

let multiply: (Int) -> Int = { (element: Int) -> Int in
    return element * 10
}

var array2 = stuck1.filter(closure:even)
print(array2)
var array3 = stuck1.map(closure: multiply)
print(array3)

//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
extension Stuck {
    subscript (index: Int) -> element?{
        return array.indices ~= index ? array[index] : nil
    }
}
stuck1[10]

