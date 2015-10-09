//: ## Advanced Operators
//: ----
//: [Previous](@previous)

import Foundation

//: Bitwise NOT Operator

let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits  // equals 11110000

//: Bitwise AND Operator

let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8  = 0b00111111
let middleFourBits = firstSixBits & lastSixBits  // equals 00111100

//: Bitwise OR Operator

let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedbits = someBits | moreBits  // equals 11111110

//: Bitwise XOR Operator

let firstBits: UInt8 = 0b00010100
let otherBits: UInt8 = 0b00000101
let outputBits = firstBits ^ otherBits  // equals 00010001

//: Bitwise Left and Right Shift Operators

let shiftBits: UInt8 = 4   // 00000100 in binary
shiftBits << 1             // 00001000
shiftBits << 2             // 00010000
shiftBits << 5             // 10000000
shiftBits << 6             // 00000000
shiftBits >> 2             // 00000001

//: Overflow Operators

var unsignedOverflow = UInt8.max
unsignedOverflow = unsignedOverflow &+ 2

unsignedOverflow = UInt8.min
unsignedOverflow = unsignedOverflow &- 1

unsignedOverflow = UInt8.max
unsignedOverflow = unsignedOverflow &* 2

//: Operator Functions

struct Vector2D {
    var x = 0.0, y = 0.0
}

func + (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
}

let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector
print(combinedVector.x, combinedVector.y)

//: Prefix and Postfix Operators

prefix func - (vector: Vector2D) -> Vector2D {
    return Vector2D(x: -vector.x, y: -vector.y)
}

postfix func ++ (inout vector: Vector2D) -> Vector2D {
    let old = vector
    vector = vector + Vector2D(x: 1.0, y: 1.0)
    return old
}

var positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive
print(negative.x, negative.y)

let positivePlus = positive++
print(positivePlus.x, positivePlus.y)
print(positive.x, positive.y)

//: Compound Assignment Operators

func += (inout left: Vector2D, right: Vector2D) {
    left = left + right
}

var original = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
original += vectorToAdd
print(original.x, original.y)

prefix func ++ (inout vector: Vector2D) -> Vector2D {
    vector += Vector2D(x: 1.0, y: 1.0)
    return vector
}

var toIncrement = Vector2D(x: 3.0, y: 4.0)
let afterIncrement = ++toIncrement

print(toIncrement.x, toIncrement.y)

//: Equivalence Operators

func == (left: Vector2D, right: Vector2D) -> Bool {
    return (left.x == right.x) && (left.y == right.y)
}

func != (left: Vector2D, right: Vector2D) -> Bool {
    return !(left == right)
}

let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)
if twoThree == anotherTwoThree {
    print("These two vectors are equivalent.")
}

//: Custom Operators

prefix operator +++ {}

prefix func +++ (inout vector: Vector2D) -> Vector2D {
    vector += vector
    return vector
}

var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
let afterDoubling = +++toBeDoubled

print(afterDoubling.x, afterDoubling.y)

//: Precedence and Associativity for Custom Infix Operators

infix operator +- { associativity left precedence 140 }

func +- (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y - right.y)
}

let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector

print(plusMinusVector.x, plusMinusVector.y)

//: [Next](@next)
