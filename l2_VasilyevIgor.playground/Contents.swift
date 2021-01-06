import UIKit

//1. Написать функцию, которая определяет, четное число или нет.
//let a: Int = 5
//let b: Int = 4
//func Chet(testParam i:Int){
//    print("Число \(i) \(i%2 == 0 ? "" :" не") четное")
//}
//Chet(testParam: a)
//Chet(testParam: b)

//2. Написать функцию, которая определяет, делится ли число без остатка на 3.

//let x: Int = 9
//let z: Int = 8
//func multiple3(testParam i:Int){
//    print("Число \(i) \(i%3 == 0 ? "" :" не") кратно 3")
//}
//multiple3(testParam: x)
//multiple3(testParam: z)

//3. Создать возрастающий массив из 100 чисел.
// первый способ
//var array:[Int] = Array(1...100)

//способ с циклом
//var array:[Int] = []
//for i in 1...100{
//    array.append(i)
//}
//print(array)

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

//var array:[Int] = Array(1...100)
//for i in (0...99).reversed(){
//    if array[i]%2 == 0{
//        array.remove(at: i)
//    } else if array[i]%3 == 0{
//        array.remove(at: i)
//    }
//}
//print(array)

//* Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
//var array:[UInt64] = []
//array.append(1)
//array.append(2)
//func addNewElement(fn1:UInt64, fn2:UInt64) -> (UInt64){
//
//    return fn1 &+ fn2
//}
//while array.count < 100 {
//    let f1:UInt64 = array[array.count-1]
//    let f2:UInt64 = array[array.count - 2]
//    array.append(addNewElement(fn1: f1, fn2: f2))
//}
//print(array)

//6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
//a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
//b. Пусть переменная p изначально равна двум — первому простому числу.
//c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
//d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
//e. Повторять шаги c и d, пока возможно.


//var arrayPrime:[Int] = []
//
//func testOnPrime(testingNumber:Int)->(Bool){
//    if testingNumber < 4{
//        return true
//    }
//    for var counter in 2...Int(testingNumber/2){
//        if testingNumber%counter == 0{
//            return false
//        }
//    }
//
//    return true
//}
//var i:Int = 2
//while arrayPrime.count < 100{
//    if testOnPrime(testingNumber: i){
//        arrayPrime.append(i)
//    }
//    i+=1
//}
//print(arrayPrime)
