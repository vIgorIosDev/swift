import UIKit

//Квадратное уравнение x2 − 2x − 3 = 0;
let a:Double = 1
let b:Double = -2
let c:Double = -3
//Вычисляем Дискриминант
let discriminant = pow(b,2)-4*a*c
if discriminant < 0{
    print("Уравнение не имеет корней!")
} else {
    
    //Вычисляем корни
    let x1 = (-1*b+sqrt(discriminant))/2*a
    let x2 = (-1*b-sqrt(discriminant))/2*a
    //Проверяем корни
    if pow(x1,2) - x1*2 - 3 == 0{
        print("Первый корень уравнения равен \(x1)")
    }else{
        print("Первый корень уравнения рассчитан неверно!")
    }
    if pow(x2,2) - x2*2 - 3 == 0 {
        print("Второй корень уравнения равен \(x2)")
    }else{
        print("Первый корень уравнения рассчитан неверно!")
    }
}

//Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
let side1: Double = 7
let side2: Double = 10
let hypotenuse = sqrt(pow(side1, 2) + pow(side2,2))
print("Гипотенуза равна \(hypotenuse)")
let area = side1*side2/2
print("Площадь равна \(area)")
let perimeter = side1 + side2 + hypotenuse
print("Периметр равен \(perimeter)")

//Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.
let DepositAmount: Double = 500 //тут вводим сумму вклада
let percent: Double = 5         // тут вводим проценты
let deys: Double = 5            // тут количество лет
let amount5yearsLater = DepositAmount + DepositAmount*percent/100/365*deys*365
print("При годовой ставке \(percent) и сумме вклада \(DepositAmount) на \(deys) лет, сумма вклада составит \(amount5yearsLater)" )
