//: ## Error Handling
//: ----
//: [Previous](@previous)

import Foundation

//: Representing Errors

enum VendingMachineError: ErrorType {
    case InvalidSelection
    case InsufficientFunds(coinsNeeded: Int)
    case OutOfStock
}

//: Propagating Errors Using Throwing Functions

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    func dispenseSnack(snack: String) {
        print("Dispensing \(snack)")
    }
    
    func vend(itemNamed name: String) throws {
        guard var item = inventory[name] else {
            throw VendingMachineError.InvalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.OutOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.InsufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        --item.count
        inventory[name] = item
        dispenseSnack(name)
    }
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

//: Handling Errors Using Do-Catch

var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack("Alice", vendingMachine: vendingMachine)
} catch VendingMachineError.InvalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.OutOfStock {
    print("Out of Stock.")
} catch VendingMachineError.InsufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
}

//: Converting Errors to Optional Values

func someThrowingFunction(a: Int) throws -> Int {
    if a > 10 {
        throw VendingMachineError.InvalidSelection
    }
    return a
}

let x = try? someThrowingFunction(5)

let y: Int?
do {
    y = try someThrowingFunction(20)
} catch {
    y = nil
}

//: Disabling Error Propagation

let z = try! someThrowingFunction(10)

//: Specifying Cleanup Actions

func numberTooHigh(number: Int) -> Int? {
    var x = try? someThrowingFunction(number)
    defer {
        print("Cleaning up") //  Will execute right after return (end of the function scope)
        if x != nil {
            print(x! * 10) // Already returned X so this value is useless here
        }
    }
    print("before return")
    return x
}

var w = numberTooHigh(10)
print("returned value: \(w)")

w = numberTooHigh(50)
print("returned value: \(w)")

//: [Next](@next)
