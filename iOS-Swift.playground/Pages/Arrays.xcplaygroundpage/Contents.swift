//: ## Arrays
//: ----
//: [Previous](@previous)

import Foundation

//: Empty Array

var someInts = [Int]()
var anyObject = [AnyObject]()

var nsArray = [] // WATCHOUT - NSArray
someInts = [] // This is ok because it was defined previously to [Int]

//: Array with a Default Value

var threeDoubles = [Double](count: 3, repeatedValue: 1.0)
var anotherThreeDoubles = [Double](count: 3, repeatedValue: 2.5)

//: Adding Two Arrays Together

var sixDoubles = threeDoubles + anotherThreeDoubles

//: Array with an Array Literal

var shoppingList = ["Eggs", "Milk"]
var shoppingList2: [String] = ["Eggs", "Milk"]
var shoppingList3 = ["Eggs", 2] // WATCHOUT - Array with NSObject
var shoppingList4: [AnyObject] = ["Eggs", 2]

//: Array Count

print(shoppingList.count)

//: Check if it is Empty

if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}

if someInts.isEmpty {
    print("The integer list is empty.")
} else {
    print("The integer list is not empty.")
}

//: Modifying an Array

shoppingList.append("Flour")
shoppingList += ["Baking Powder"]
shoppingList[0] = "Six eggs"
shoppingList.insert("Maple Syrup", atIndex: 0)
let mapleSyrup = shoppingList.removeAtIndex(0)
let apples = shoppingList.removeLast()
print(shoppingList)

//: Iterating Over an Array

for i in 0..<shoppingList.count {
    print(shoppingList[i])
}

for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerate() {
    print("\(index): \(value)")
}

//: Sorting Arrays

var sortShoppingList = shoppingList.sort()
sortShoppingList = shoppingList.sort({ (a: String, b: String) -> Bool in
    return a > b
})
print(sortShoppingList)

//: Sorting Tuples/Objects

typealias MyTuple = (objectId: Int, name: String)
var customList: [MyTuple] = []
customList.append((objectId: 1, name: "First"))
customList.append((objectId: 2, name: "Second"))
customList.append((objectId: 3, name: "Third"))
customList.append((objectId: 4, name: "Fourth"))
customList = customList.sort({ (a: MyTuple, b: MyTuple) -> Bool in
    return a.name < b.name
})
print(customList)

//: [Next](@next)
