import UIKit

enum Brands: String {
    case Audy,
         Scoda,
         Ford
}

//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
enum CarAction {
    case runEngine(RunEngineAction),
         openWindow(OpenWindowAction),
         trunk(TrunkAction),
         luke(LukeAction)
    
    
    enum RunEngineAction {
        case run,stop
    }
    enum OpenWindowAction {
        case open,close
    }
    enum TrunkAction {
        case put(Int), take(Int)
    }
    enum LukeAction {
        case open, close
    }
    
}


//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
class Car {
    var brand: Brands
    var year: Int
    var engineIsRunning: Bool
    var windowsOpen: Bool
    
    func doAction (_ action :CarAction) {
        
    }
    
    func printDescription(){
        print("brand = \(self.brand), year = \(self.year), engineIsRunning = \(self.engineIsRunning), windowsOpen = \(self.windowsOpen)")
    }
    init(brand: Brands, year: Int,  engineIsRunning: Bool, windowsOpen: Bool) {
        self.brand = brand
        self.engineIsRunning = engineIsRunning
        self.windowsOpen = windowsOpen
        self.year = year
    }
        
    
}

//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
class SportCar: Car {
    var lukeOpen: Bool
    
    init(brand: Brands,
         year: Int,
         engineIsRunning: Bool,
         windowsOpen: Bool,
         lukeOpen:Bool)
    {
        self.lukeOpen = lukeOpen
        super.init(brand: brand,
                   year: year,
                   engineIsRunning: engineIsRunning,
                   windowsOpen: windowsOpen)
    }
    
    //4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
    override func doAction(_ action: CarAction) {
        switch action {
        case let .openWindow(action):
            windowsOpen = action == .open
        case let .runEngine(action):
            engineIsRunning = action == .run
        case let .luke(action):
            lukeOpen = action == .open
        default:
            print("Других действий не предусмотренно")
        }
    }
    override func printDescription() {
        super.printDescription()
        print("lukeOpen = \(lukeOpen)")
    }
}

//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
class TrunkCar: Car {
    var maxTrunkVolume: Int
    var currentTrunkVolume: Int
    
    init(brand: Brands,
         year: Int,
         engineIsRunning: Bool,
         windowsOpen: Bool,
         currentTrunkVolume: Int,
         maxTrunkVolume: Int
    )
    {
        self.maxTrunkVolume = maxTrunkVolume
        self.currentTrunkVolume = currentTrunkVolume
        super.init(brand: brand,
                   year: year,
                   engineIsRunning: engineIsRunning,
                   windowsOpen: windowsOpen)
    }
    
    //4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
    override func doAction(_ action: CarAction) {
        switch action {
        case let .openWindow(action):
            windowsOpen = action == .open
        case let .runEngine(action):
            engineIsRunning = action == .run
        case let .trunk(trunkAction):
            switch trunkAction {
            case let .put(value):
                guard currentTrunkVolume + value <= maxTrunkVolume else {return}
                currentTrunkVolume += value
                
            case let .take(value):
                guard currentTrunkVolume - value >= 0 else {return}
                currentTrunkVolume -= value
            }
            print("В кузове \(currentTrunkVolume) кг из \(maxTrunkVolume) возможных")
        default:
            print("Других действий не предусмотренно")
        }
    }
    override func printDescription() {
        super.printDescription()
        print("maxTrunkVolume = \(maxTrunkVolume), currentTrunkVolume = \(currentTrunkVolume)")
    }
}

//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
var car1 = SportCar(brand: .Audy, year: 2000,  engineIsRunning: true, windowsOpen: false, lukeOpen: false)
var car2 = SportCar(brand: .Ford, year: 2020,  engineIsRunning: true, windowsOpen: false, lukeOpen: false)
var trunk1 = TrunkCar(brand: .Ford, year: 2020,  engineIsRunning: true, windowsOpen: false, currentTrunkVolume: 500, maxTrunkVolume: 2000)

car2.doAction(.luke(.open))
car1.doAction(.trunk(.put(200)))

trunk1.doAction(.trunk(.put(200)))
trunk1.doAction(.trunk(.take(100)))

//6. Вывести значения свойств экземпляров в консоль.
car1.printDescription()
trunk1.printDescription()
