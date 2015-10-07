//: ## Constants and Variables
//: ----
//: [Previous](@previous)

import Foundation

//: Constants

let constant = "My first constant!"

//: Variables

var variable = "My first variable!"
var r = 250.0, g = 100.0, b = 210.0

//: Type Annotations
var hello: String
hello = "Hello!"

//: Emoji Names
//: - Emoji shortcut: control + command + space
let 😎 = ":)"

//: Printing

print(😎)
print("Using a string with a constant or variable: \(hello)")

//: Comments

// One line comment

/*
Multiple
Lines
Comment
*/

//: Integer

let intConstant1 = 10
let intConstant2: Int = 10
let uIntConstant: UInt = 20
let uInt8Constant: UInt8 = 8
let uInt16Constant: UInt16 = 16
let uInt32Constant: UInt32 = 32
let uInt64Constant: UInt64 = 21

//: Float

let floatConstant: Float = 10.5

//: Double

let doubleConstant1 = 30.7
let doubleConstant2: Double = 30.7

//: Boolean

let trueConstant = true
let falseConstant: Bool = false

//: String

let stringConstant1 = "You already know that, right?"
let stringConstant2: String = "Yes, you know!"

//: Tuples

let tupleWith2Values = (100, "A message")
let tupleWith2NamedValues = (number: 200, text: "Another Message")
let (intValue, stringValue) = tupleWith2Values
let (onlyTheIntValue, _) = tupleWith2NamedValues
let (_, onlyTheStringValue) = tupleWith2NamedValues
let standardConstantFromTuple = tupleWith2Values.0
let standardConstantFromNamedTuple = tupleWith2NamedValues.text

print(
    intValue,
    stringValue,
    onlyTheIntValue,
    onlyTheStringValue,
    standardConstantFromTuple,
    standardConstantFromNamedTuple
)

//: Type aliases

typealias MyInt = Int8
var customAlias1 = MyInt.min
var customAlias2 = MyInt.max

//: Converting types

let doubleToIntConstant = Int(45.32)
let intToDoubleConstant = Double(50)

//: [Next](@next)
