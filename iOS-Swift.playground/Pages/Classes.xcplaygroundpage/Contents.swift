//: ## Classes
//: ----
//: [Previous](@previous)

import Foundation

//: Classes Are Reference Types

class DataImporter {
    var fileName = "data.txt"
}

let dataImporter = DataImporter()
let aux = dataImporter
print(dataImporter.fileName, aux.fileName)

aux.fileName = "other.txt"
print(dataImporter.fileName, aux.fileName)

//: Lazy Stored Properties

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
print(manager.importer.fileName) // the DataImporter instance for the importer property has now been created

//: Computed Properties

class Point {
    var x = 0.0, y = 0.0
}

class Size {
    var width = 0.0, height = 0.0
}

class Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            let point = Point()
            point.x = centerX
            point.y = centerY
            return point
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

let square = Rect()
square.origin.x = 0.0
square.origin.y = 0.0
square.size.width = 10.0
square.size.height = 10.0

let newPoint = Point()
newPoint.x = 15.0
newPoint.y = 15.0
square.center = newPoint
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")

//: Read-Only Computed Properties

class Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid()
fourByFiveByTwo.width = 4.0
fourByFiveByTwo.height = 5.0
fourByFiveByTwo.depth = 2.0
print("the volume is \(fourByFiveByTwo.volume)")

//: Property Observers

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896

//: Type Property

class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    
    // use the class keyword to allow subclasses to override the superclass’s implementation
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

print(SomeClass.storedTypeProperty)

SomeClass.storedTypeProperty = "Another value."
print(SomeClass.storedTypeProperty)

//: Singleton

class Manager {
    static var sharedManager = Manager()
    var name = "Manager Singleton"
}

print(Manager.sharedManager.name)

//: Instance Methods

class Counter {
    var count = 0
    func increment() {
        ++count
    }
    func incrementBy(amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

let counter = Counter()
print(counter.count)

counter.increment()
print(counter.count)

counter.incrementBy(5)
print(counter.count)

counter.reset()
print(counter.count)

//: Local and External Parameter Names for Methods

class Rectangle {
    var width = 0
    var height = 0
    func multiplyWidthWith(width: Int) {
        self.width *= width
    }
}

let rect = Rectangle()

rect.width = 10
print(rect.width)

rect.multiplyWidthWith(5)
print(rect.width)

//: Type Methods

class AnotherClass {
    class func someTypeMethod() {
        print("type method!")
    }
}

AnotherClass.someTypeMethod()

//: Initialization

class Player {
    
    let playerName: String
    var playerAge: Int?
    
    init() {
        playerName = "Unknown"
    }
    
    init(name: String) {
        playerName = name
    }
    
    convenience init(name: String, surname: String) {
        self.init(name: name + " " + surname)
    }
    
    init?(fullname: String) {
        playerName = fullname
        if fullname.isEmpty {
            return nil
        }
    }
    
    // For subclasses
    required init(name: String, age: Int) {
        playerName = name
        playerAge = age
    }
}

let anyone = Player()
print(anyone.playerName)

let player = Player(name: "Mark")
print(player.playerName)

let proPlayer = Player(name: "Michael", surname: "Jordan")
print(proPlayer.playerName)

let failPlayer = Player(fullname: "")
print(failPlayer)

let fullnamePlayer = Player(fullname: "Tiger Woods")
print(fullnamePlayer!.playerName)

//: Deinitialization

class Temp {
    
    let name: String
    
    init() {
        name = "My name"
    }
    
    deinit {
        print("Goodbye!")
    }
}

var temp: Temp? = Temp()
print(temp?.name)

temp = nil // Call deinit

//: Subscripts

class Game {
    var name = "Game Name"
    var players: [String] = []
    init(withPlayers: [String]) {
        players = withPlayers
    }
    subscript(index: Int) -> String {
        return players[index]
    }
}

let match = Game(withPlayers: ["John", "Mark", "Patrick"])
print(match[0])
print(match[1])
print(match[2])

//: Inheritance

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {}
}

let someVehicle = Vehicle()
print(someVehicle.description)

class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print(bicycle.description)

//: Overriding Methods

class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()

//: Overriding Properties

class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
print(car.description)

//: Overriding Property Observers

class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print(automatic.description)

//: Preventing Overrides

class FutureCar: Car {
    final var technology = "Unknown"
}

//: Optional Property Types

class SurveyQuestion {
    let title: String
    var text: String
    var response: String?
    init(text: String) {
        self.title = "No Title"
        self.text = text
    }
    func ask() {
        print(text)
    }
}

let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes, I do like cheese."

//: Weak References

class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var john: Person?
var unit4A: Apartment?

john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john

john = nil
unit4A = nil

//: Unowned References

class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized") }
}

var mark: Customer?
mark = Customer(name: "Mark Nichols")
mark!.card = CreditCard(number: 1234_5678_9012_3456, customer: mark!)

mark = nil


//: [Next](@next)
