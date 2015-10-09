//: ## Generics
//: ----
//: [Previous](@previous)

import Foundation

//: Generic Functions

func swapTwoValues<T>(inout a: T, inout _ b: T) { // T is a placeholder for a type parameter
    let temporaryA = a
    a = b
    b = temporaryA
}

var x = 3, y = 5, w = 350.1, h = 25.5, s1 = "First", s2 = "Second"

swapTwoValues(&x, &y)
swapTwoValues(&w, &h)
swapTwoValues(&s1, &s2)

print(x, y, w, h, s1, s2)

//: Generic Types

struct Stack<Element> {
    var items = [Element]()
    mutating func push(item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfStrings = Stack<String>()

stackOfStrings.push("um")
stackOfStrings.push("dois")
stackOfStrings.push("tres")
stackOfStrings.push("quatro")

let fromTheTop = stackOfStrings.pop()

//: Extending a Generic Type

extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

if let topItem = stackOfStrings.topItem {
    print("The top item on the stack is \(topItem).")
}

//: Type Constraints

// Equatable means that it is guaranteed to support the equal to operator
func findStringIndex<T: Equatable>(array: [T], _ valueToFind: T) -> Int? {
    for (index, value) in array.enumerate() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findStringIndex(strings, "llama") {
    print("The index of llama is \(foundIndex)")
}

//: Associated Types

protocol Container {
    typealias ItemType
    mutating func append(item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}

struct NewStack<Element>: Container {
    var items = [Element]()
    mutating func push(item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    // conformance to the Container protocol
    mutating func append(item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}

var newStackOfStrings = NewStack<String>()

newStackOfStrings.push("one")
newStackOfStrings.push("two")
newStackOfStrings.push("three")
newStackOfStrings.push("four")

print(newStackOfStrings.count)

//: Extending an Existing Type to Specify an Associated Type

extension Array: Container {} // Already has append(), count and Int index (subscript)

//: Where Clauses

func allItemsMatch<
    C1: Container, C2: Container
    where C1.ItemType == C2.ItemType, C1.ItemType: Equatable>
    (someContainer: C1, _ anotherContainer: C2) -> Bool {
        
        // check that both containers contain the same number of items
        if someContainer.count != anotherContainer.count {
            return false
        }
        
        // check each pair of items to see if they are equivalent
        for i in 0..<someContainer.count {
            if someContainer[i] != anotherContainer[i] {
                return false
            }
        }
        
        // all items match, so return true
        return true
}

print(newStackOfStrings)

let listOfStrings = ["one", "two", "three", "four"]

if allItemsMatch(newStackOfStrings, listOfStrings) {
    print("All items match.")
} else {
    print("Not all items match.")
}

//: [Next](@next)
