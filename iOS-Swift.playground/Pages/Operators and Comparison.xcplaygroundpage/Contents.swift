//: ## Operators and Comparison
//: ----
//: [Previous](@previous)

import Foundation

//: Assignment

var a = 11
var b = 4
let (x, y) = (1, 2)

//: Arithmetic

let addition = a + b
let subtraction = a - b
let multiplication = a * b
let division = a / b
let remainder = a % b
let concatenation = "hello " + "world"

//: Increment and Decrement

b = 10
a = ++b
a = b++
a = --b
a = b--
a = b

//: Unary Minus

a = -b

//: Compound Assignment

a = 0
a += b
a -= b
a = 5
a *= b
a /= b

//: Comparison

// Binary
if a == b {
    print("equal")
} else if a > b {
    print("greater")
} else if a <= b {
    print("less or equal")
} else {
    print("something is wrong!")
}

// Logical NOT
if a != 10 {
    print("a is not 10")
}
var check = false
if !check {
    print("testing bool")
}

// Logical AND
if a >= 5 && b <= 10 {
    print("a >= 5 AND b <= 10")
}

// Logical OR
if a == 5 || b == 10 {
    print("a == 5 OR b == 10")
}

// Compound
if (a != 10 || b == 5) && !check {
    print("Complex comparison")
}

//: Ternary Conditional

var isTrue = true
a = (isTrue ? 10 : 20)
isTrue = false
a = (isTrue ? 10 : 20)

//: Switch
//: "break" is not really needed, only if you want to break in the middle of the block

// Standard
var letter = "a"
switch letter {
case "b":
    print("letter = b")
case "a":
    print("letter = a")
    if letter == "a" {
        break
    }
    print("never shown")
default:
    print("not expected")
}

// Interval Matching
var number = 42
switch number {
case 0:
    print("it is zero")
case 1..<50:
    print("less then 50%")
case 50:
    print("it is 50%")
case 51..<100:
    print("greater than 50%")
case 100:
    print("it is 100%")
default:
    print("other values")
}

// Tuples
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    print("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
}

// Value Bindings
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y): // default
    print("somewhere else at (\(x), \(y))")
}

// Where
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}

// Fallthrough
a = 1
switch a {
case 1:
    print("a == 1")
    fallthrough
case 2:
    print("a == 2?")
case 3:
    print("a == 3?")
default:
    print("another number")
}

//: Checking API Availability

if #available(iOS 9, OSX 10.10, *) {
    // Use iOS 9 APIs on iOS, and use OS X v10.10 APIs on OS X
} else {
    // Fall back to earlier iOS and OS X APIs
}

//: [Next](@next)
