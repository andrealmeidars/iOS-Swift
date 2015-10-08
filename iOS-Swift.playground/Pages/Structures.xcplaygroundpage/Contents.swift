//: ## Structures
//: ----
//: [Previous](@previous)

import Foundation

//: Definition Syntax

struct Resolution {
    var width = 0
    var height = 0
    func pixels() -> Int {
        return width * height
    }
}

//: Structure Instances

var vga = Resolution(width: 0, height: 480)

//: Accessing Properties

vga.width = 1280
print("The width of vga is \(vga.width)")

//: Structures Are Value Types

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
print(hd.width, cinema.width)

//: Methods

print(cinema.pixels())

//: [Next](@next)
