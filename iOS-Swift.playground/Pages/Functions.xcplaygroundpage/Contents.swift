//: ## Functions
//: ----
//: [Previous](@previous)

import Foundation

//: Defining and Calling Functions

func sayHello() {
    print("Hello!")
}
sayHello()

//: Single Parameter

func sayHelloTo(name: String) {
    print("Hello " + name)
}

sayHelloTo("John")

//: Multiple Parameters

func tell(something: String, to: String) {
    print(something + ", " + to + "!")
}

tell("Good morning", to: "Jack")

//: Specifying External Parameter Names

func say(something something: String, to name: String) {
    print(something + ", " + name + "!")
}

say(something: "Good morning", to: "Jack")

//: Omitting External Parameter Names

func sumAB(a: Int, _ b: Int) {
    print(a + b)
}

sumAB(5, 4)

//: Default Parameter Values

func mult(a: Int, b: Int = 10) {
    print(a * b)
}

mult(5)
mult(5, b: 2)

//: Variadic Parameters

func sumInts(numbers: Int...) {
    var total = 0
    for number in numbers {
        total += number
    }
    print(total)
}

sumInts(1,2,3)
sumInts(5,6,7,8,9,10)

//: Variable Parameters

func printString(var str: String) {
    str = "changed!"
    print(str)
}

printString("anything")

//: In-Out Parameters

func changeValueInside(inout a: Int) {
    a += 10
}

var num = 5
changeValueInside(&num)
print(num)

//: Return Values

func getName() -> String {
    return "Bob"
}
print(getName())

func getAge() -> Int {
    return 30
}
print(getAge())

//: Optional Return Value

func restrictions(age: Int) -> String? {
    if age < 21 {
        return "Can't do it"
    }
    return nil
}
print(restrictions(15))
print(restrictions(51))

//: Multiple Return Values - Tuple

func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax([8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")

//: Function Types

func addTwoInts(a: Int, _ b: Int) -> Int {
    return a + b
}
var mathFunction: (Int, Int) -> Int = addTwoInts
print(mathFunction(2, 3))
var otherMathFunction = addTwoInts
print(otherMathFunction(4, 3))

//: Function Types as Parameter Types

func printMathResult(mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print(mathFunction(a, b))
}
printMathResult(addTwoInts, 3, 5)

//: Function Types as Return Types

func stepForward(input: Int) -> Int {
    return input + 1
}

func stepBackward(input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    return backwards ? stepBackward : stepForward
}

var currentValue = 3
var moveNearerToZero = chooseStepFunction(currentValue > 0)
moveNearerToZero(currentValue)

//: Nested Functions

func chooseStepFunction2(backwards: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backwards ? stepBackward : stepForward
}
currentValue = -4
moveNearerToZero = chooseStepFunction2(currentValue > 0)
moveNearerToZero(currentValue)

//: [Next](@next)
