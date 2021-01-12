import UIKit

enum Brands: String{
    case Skoda,Audi,Susuki
}
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
enum activities {
    case RunEngine(isRun: Bool)
    case OpenWindow(IsOpen: Bool)
    case loadUnload(load: Float,unload: Float)
}

//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.

struct SportCar {
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
    var brand: Brands
    var year: Int
    var maxTrunkVolume: Float
    var engineIsRunning: Bool
    var windowsOpen: Bool
    var filledTrunkVolume: Bool{
        get {
            return maxTrunkVolume == currentTrunkVolume
        }
    }
    var currentTrunkVolume:Float{
        willSet {
            print("Занятый объем багажника \(newValue)")
        }
    }
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
    mutating func doActivities(action:activities){
        switch action {
        case .RunEngine(isRun: let isRun):
            engineIsRunning = isRun
        case .loadUnload(load: let load, unload: let unload):
            currentTrunkVolume = currentTrunkVolume + load - unload
        case .OpenWindow(IsOpen: let IsOpen):
            windowsOpen = IsOpen
        }
    }
    init (brand:Brands,
         year: Int,
         maxTrunkVolume: Float,
         engineIsRunning: Bool,
         windowsOpen: Bool,
         currentTrunkVolume: Float) {
        self.brand = brand
        self.year = year
        self.maxTrunkVolume = maxTrunkVolume
        self.engineIsRunning = engineIsRunning
        self.windowsOpen = windowsOpen
        self.currentTrunkVolume = currentTrunkVolume
    }
    init?(brand:Brands){
        switch brand {
        case .Audi:
            self.brand = brand
            self.year = 2007
            self.maxTrunkVolume = 525
            self.engineIsRunning = false
            self.windowsOpen = false
            self.currentTrunkVolume = 0
        default:
            return nil
        }
    }
}

struct TrunkCar {
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
    var brand: Brands
    var year: Int
    var maxTrunkVolume: Float
    var engineIsRunning: Bool
    var windowsOpen: Bool
    var filledTrunkVolume: Bool{
        get {
            return maxTrunkVolume == currentTrunkVolume
        }
    }
    var currentTrunkVolume:Float{
        willSet {
            print("Занятый объем багажника \(newValue)")
        }
    }
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
    mutating func doActivities(action:activities){
        switch action {
        case .RunEngine(isRun: let isRun):
            engineIsRunning = isRun
        case .loadUnload(load: let load, unload: let unload):
            currentTrunkVolume = currentTrunkVolume + load - unload
        case .OpenWindow(IsOpen: let IsOpen):
            windowsOpen = IsOpen
        }
    }
}

//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
let trunkCar = TrunkCar(brand:.Susuki,year:2000,maxTrunkVolume: 3000,engineIsRunning: false,windowsOpen: false,currentTrunkVolume: 500)
var car1 = SportCar(brand:.Skoda,year: 2005,maxTrunkVolume: 500.0,engineIsRunning: false,windowsOpen: true,currentTrunkVolume: 200.0)
var car2 = SportCar(brand:.Audi)!
car1.doActivities(action: .RunEngine(isRun: true))
car1.doActivities(action: .loadUnload(load: 500, unload: 300))
car2.doActivities(action: .loadUnload(load: 500, unload: 0))
//6. Вывести значения свойств экземпляров в консоль.
print(car1)
print(car2)
print(trunkCar)
