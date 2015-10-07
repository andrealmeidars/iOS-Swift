//: ## Dictionaries
//: ----
//: [Previous](@previous)

import Foundation

//: Empty Dictionary

var namesOfIntegers = [Int: String]()
namesOfIntegers = [:]

//: Dictionary with a Dictionary Literal

var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
var airports2 = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

//: Dictionary Count

print(airports.count)

//: Check if it is Empty

if namesOfIntegers.isEmpty {
    print("The name of integers dictionary is empty.")
} else {
    print("The name of integers dictionary is not empty.")
}

if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is not empty.")
}

//: Modifying a Dictionary

airports["LHR"] = "London"

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print(oldValue)
    print(airports["DUB"])
}

print(airports)
airports["DUB"] = nil
print(airports)

if let removedValue = airports.removeValueForKey("LHR") {
    print("Removed \(removedValue)")
} else {
    print("The airports dictionary does not contain a value for LHR.")
}
print(airports)

//: Iterating Over a Dictionary

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values {
    print("Airport name: \(airportName)")
}

//: Get Dictionary List

let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)

//: [Next](@next)
