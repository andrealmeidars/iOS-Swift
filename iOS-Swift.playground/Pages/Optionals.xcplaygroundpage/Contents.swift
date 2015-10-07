//: ## Optionals
//: ----
//: [Previous](@previous)

import Foundation

//: Declaration

var code: Int?
print(code)

//: Unwrapping

code = 10
var num: Int = code!

//: Can set nil

code = nil

//: Testing

if code != nil {
    print("Not nil")
}
if code == nil {
    print("Is nil")
}
num = (code != nil ? code! : 20)
code = 10
num = (code != nil ? code! : 20)

//: Optional Binding

code = nil
if let newCode = code {
    print("newCode exists")
    print("let's do something!")
}
code = 10
if let newCode = code {
    print("newCode exists")
    print("let's do something!")
}

//: [Next](@next)
