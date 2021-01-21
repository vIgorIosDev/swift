import UIKit

enum Brands: String {
    case Audy,
         Scoda,
         Ford
}


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

//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
protocol Car  {
    var brand: Brands { get set }
    var year: Int { get set }
    var engineIsRunning: Bool { get set }
    var windowsOpen: Bool { get set }
    func doAction (_ action :CarAction)
}

//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
extension Car {
    mutating func doAction(_ action:CarAction) -> Void {
        switch action {
        case let .openWindow(action):
            windowsOpen = action == .open
        case let .runEngine(action):
            engineIsRunning = action == .run
        default:
            print("Других действий не предусмотренно")
        }
    }
}

//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
class TrunkCar : Car {

    var brand: Brands
    var year: Int
    var engineIsRunning: Bool
    var windowsOpen: Bool
    var maxTrunkVolume: Int
    var currentTrunkVolume: Int

    
    func doAction(_ action: CarAction) {
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
    
    init (brand: Brands,
         year: Int,
         engineIsRunning: Bool,
         windowsOpen: Bool,
         currentTrunkVolume: Int,
         maxTrunkVolume: Int
    )
    {
        self.maxTrunkVolume = maxTrunkVolume
        self.currentTrunkVolume = currentTrunkVolume
        self.brand = brand
        self.engineIsRunning = engineIsRunning
        self.windowsOpen = windowsOpen
        self.year = year
      
    }
    
    
}

//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
extension TrunkCar: CustomStringConvertible{

    var description: String {
        return " brand = \(brand), year = \(year),  engineIsRunning = \(engineIsRunning),  windowsOpen = \(windowsOpen), maxTrunkVolume = \(maxTrunkVolume), currentTrunkVolume =\(currentTrunkVolume)"
    }
}

class SportCar: Car {
    
    var brand: Brands
    var year: Int
    var engineIsRunning: Bool
    var windowsOpen: Bool
    var lukeOpen: Bool
    
    
    init(brand: Brands,
         year: Int,
         engineIsRunning: Bool,
         windowsOpen: Bool,
         lukeOpen:Bool)
    {
        self.lukeOpen = lukeOpen
        self.brand = brand
        self.engineIsRunning = engineIsRunning
        self.windowsOpen = windowsOpen
        self.year = year
    }
    

    func doAction(_ action: CarAction) {
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
    
}

//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
extension SportCar: CustomStringConvertible {

    var description: String {
        return " brand = \(brand), year = \(year),  engineIsRunning = \(engineIsRunning),  windowsOpen = \(windowsOpen), lukeOpen = \(lukeOpen)"
    }
}

//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
var sportCar1 = SportCar(brand: .Audy, year: 2000,  engineIsRunning: true, windowsOpen: false, lukeOpen: false)
var sportCar2 = SportCar(brand: .Ford, year: 2020,  engineIsRunning: true, windowsOpen: false, lukeOpen: false)
sportCar1.doAction(.openWindow(.open))
sportCar2.doAction(.runEngine(.run))

var truncCar1 = TrunkCar(brand: .Ford, year: 2020,  engineIsRunning: true, windowsOpen: false, currentTrunkVolume: 500, maxTrunkVolume: 2000)
truncCar1.doAction(.trunk(.put(200)))

//6. Вывести сами объекты в консоль.
print(sportCar1)
print(sportCar2)
print(truncCar1)
