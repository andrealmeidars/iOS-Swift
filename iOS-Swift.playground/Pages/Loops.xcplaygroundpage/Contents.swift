//: ## Loops
//: ----
//: [Previous](@previous)

import Foundation

//: For-In

// Closed Range
for index in 1...5 {
    print("\(index)")
}

// Half-Open Range
for index in 1..<5 {
    print("\(index)")
}

// Don't need to declare index
var a = 0
for _ in 1...5 {
    a++
}
print(a)

// Iterating Over an Array
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}

// Iterating Over a Dictionary
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

//: For

for var index = 0; index < 3; ++index {
    print("index is \(index)")
}

//: While

var sum = 0
while sum < 10 {
    sum++
}
print(sum)

//: Repeat-While

sum = 0
repeat {
    sum++
} while sum < 10
print(sum)

//: Control Transfer Statements

// Continue - go to the next index
var count = 0
for index in 0...50 {
    if index >= 3 {
        continue
    }
    count++
}
print(count)

// Break - stop the loop or switch
count = 0
for index in 0...50 {
    if index == 3 {
        break
    }
    count++
}
print(count)

//: Labeled Loop

count = 0
countLoop: while count < 5 {
    if count == 3 {
        break countLoop
    }
    if count == 4 {
        continue countLoop
    }
    count++
}
print(count)

//: [Next](@next)
