//: ## Operators
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

//: Loop

// Closed Range
for index in 1...5 {
    print("\(index)")
}

// Half-Open Range
for index in 1..<5 {
    print("\(index)")
}

//: [Next](@next)
