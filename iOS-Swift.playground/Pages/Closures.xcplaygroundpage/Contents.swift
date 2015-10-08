//: ## Closures
//: ----
//: [Previous](@previous)

import Foundation

//: The Sort Method

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backwards(s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var reversed = names.sort(backwards)

// OR

reversed = names.sort({ (s1: String, s2: String) -> Bool in
    return s1 > s2
})
print(reversed)

//: Inferring Type From Context

reversed = names.sort( { s1, s2 in return s1 > s2 } )
print(reversed)

//: Implicit Returns from Single-Expression Closures

reversed = names.sort( { s1, s2 in s1 > s2 } )
print(reversed)

//: Shorthand Argument Names

reversed = names.sort( { $0 > $1 } )
print(reversed)

//: Operator Functions

reversed = names.sort(>)
print(reversed)

//: Trailing Closures

func sum(a: Int, _ b: Int, closure: (c: Int) -> Int) -> Int {
    return closure(c: a + b)
}

var result = sum(20, 25) {
    var c = $0 + 10
    return c
}

//: Capturing Values

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)

incrementByTen()
incrementByTen()
incrementByTen()

let incrementBySeven = makeIncrementer(forIncrement: 7)

incrementBySeven()
incrementBySeven()

incrementByTen()
incrementBySeven()

//: Closures Are Reference Types

let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()

//: Autoclosures

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)

let customerProvider = { customersInLine.removeAtIndex(0) }
print(customersInLine.count)

print("Now serving \(customerProvider())!")
print(customersInLine.count)

//

func serveCustomer(customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}

serveCustomer( { customersInLine.removeAtIndex(0) } )
print(customersInLine.count)

//

func serveOtherCustomer(@autoclosure customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}

serveOtherCustomer(customersInLine.removeAtIndex(0))
print(customersInLine.count)

//: Escaping - Using variables from outside the closure

customersInLine = ["Barry", "Daniella"]
var customerProviders: [() -> String] = []
func collectCustomerProviders(@autoclosure(escaping) customerProvider: () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.removeAtIndex(0))
collectCustomerProviders(customersInLine.removeAtIndex(0))

print("Collected \(customerProviders.count) closures.")

for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}

//: [Next](@next)
