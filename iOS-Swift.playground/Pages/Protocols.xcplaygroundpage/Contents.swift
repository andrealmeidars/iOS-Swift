//: ## Protocols
//: ----
//: [Previous](@previous)

import Foundation

//: Property Requirements

protocol FullyNamed {
    var fullName: String? { get set }
}

class Person: FullyNamed {
    var fullName: String?
}

let john = Person()
john.fullName = "John Appleseed"
print(john.fullName)

//: Method Requirements

protocol PrintName {
    func printName()
}

class Player: Person, PrintName {
    func printName() {
        print("Player name is \(fullName)")
    }
}

let jack = Player()
jack.fullName = "Jack Simpson"
jack.printName()

//: Initializer Requirements

protocol InitWithFullName {
    init(fullName: String)
}

class Employee: Person, InitWithFullName {
    required init(fullName: String) {
        super.init()
        self.fullName = fullName
    }
}

let mark = Employee(fullName: "Mark Johnson")
print(mark.fullName)

//: Delegation

protocol TableDelegate {
    func numOfRows() -> Int
}

class Table {
    var tableDelegate: TableDelegate?
    func howMany() {
        print(tableDelegate?.numOfRows())
    }
}

class View: TableDelegate {
    var table = Table()
    func numOfRows() -> Int {
        return 10
    }
}

let view = View()
view.table.tableDelegate = view
view.table.howMany()

//: Adding Protocol Conformance with an Extension

extension View: PrintName {
    func printName() {
        print("View Name!")
    }
}

let secondView = View()
secondView.printName()

//: Collections of Protocol Types

protocol TextRepresentable {
    var textualDescription: String { get }
}

class Text: TextRepresentable {
    var title: String
    init() {
        self.title = ""
    }
    init(title: String) {
        self.title = title
    }
    var textualDescription: String {
        return "Title: \(self.title)"
    }
}

let t1 = Text(title: "One")
let t2 = Text(title: "Two")
let t3 = Text(title: "Three")

let things: [TextRepresentable] = [t1, t2, t3]

for thing in things {
    print(thing.textualDescription)
}

//: Protocol Inheritance

protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}

class PrettyText: PrettyTextRepresentable {
    var title: String
    init() {
        self.title = ""
    }
    init(title: String) {
        self.title = title
    }
    var textualDescription: String {
        return "Title: \(self.title)"
    }
    var prettyTextualDescription: String {
        return "Pretty Title: \(self.title)"
    }
}

var pretty = PrettyText(title: "Awesome!")
print(pretty.prettyTextualDescription)

//: Class-Only Protocols

protocol SomeClassOnlyProtocol: class {
    func showName()
}

class Test: SomeClassOnlyProtocol { // try changinf class to struct
    func showName() {
        print("name")
    }
}

//: Protocol Composition

protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

class Member: Named, Aged {
    var name: String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

func wishHappyBirthday(celebrator: protocol<Named, Aged>) {
    print("Happy birthday \(celebrator.name) - you're \(celebrator.age)!")
}

let birthdayPerson = Member(name: "Malcolm", age: 21)
wishHappyBirthday(birthdayPerson)

//: Checking for Protocol Conformance

protocol HasArea {
    var area: Double { get }
}

class Country: HasArea {
    var area: Double
    init(area: Double) { self.area = area }
}

class Animal {
    var legs: Int
    init(legs: Int) { self.legs = legs }
}

let objects: [AnyObject] = [
    Country(area: 243_610),
    Animal(legs: 4)
]

for object in objects {
    if let objectWithArea = object as? HasArea {
        print("Area is \(objectWithArea.area)")
    } else {
        print("Something that doesn't have an area")
    }
}

//: Optional Protocol Requirements

@objc protocol CounterDataSource { // exposed to objective-c (required for optionals)
    optional func incrementForCount(count: Int) -> Int
    optional var fixedIncrement: Int { get }
}

class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.incrementForCount?(count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}

class ThreeSource: NSObject, CounterDataSource {
    let fixedIncrement = 3
}

var counter = Counter()
counter.dataSource = ThreeSource()
for _ in 1...4 {
    counter.increment()
    print(counter.count)
}

//: Protocol Extensions

protocol RandomNumberGenerator {
    func random() -> Double
}

extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c) % m)
        return lastRandom / m
    }
}

let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
print("And here's a random Boolean: \(generator.randomBool())")

//: Adding Constraints to Protocol Extensions

extension CollectionType where Generator.Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map { $0.textualDescription }
        return "[" + itemsAsText.joinWithSeparator(", ") + "]"
    }
}

let movie1 = Text(title: "Movie1")
let movie2 = Text(title: "Movie2")
let movie3 = Text(title: "Movie3")

let movies = [movie1, movie2, movie3]
print(movies.textualDescription)

//: [Next](@next)
