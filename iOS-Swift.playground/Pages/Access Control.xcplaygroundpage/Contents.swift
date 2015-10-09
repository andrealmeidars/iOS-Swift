//: ## Access Control
//: ----
//: [Previous](@previous)

import Foundation

//: Access Control Syntax

// Free access anywhere
public class SomePublicClass {}

// Access inside the same module
internal class SomeInternalClass {}

// Access inside the same file
private class SomePrivateClass {}

class AnotherInternalClass {}  // implicitly internal

//: Custom Types

public class APublicClass {              // explicitly public class
    public var somePublicProperty = 0    // explicitly public class member
    var someInternalProperty = 0         // implicitly internal class member
    private func somePrivateMethod() {}  // explicitly private class member
}

class AnInternalClass {                  // implicitly internal class
    var someInternalProperty = 0         // implicitly internal class member
    private func somePrivateMethod() {}  // explicitly private class member
}

private class APrivateClass {            // explicitly private class
    var somePrivateProperty = 0          // implicitly private class member
    func somePrivateMethod() {}          // implicitly private class member
}

//: Enumeration Types

public enum CompassPoint {
    case North
    case South
    case East
    case West
}

//: Subclassing

public class A {
    private func someMethod() {}
}

internal class B: A {
    override internal func someMethod() {
        super.someMethod()
    }
}

//: Constants, Variables, Properties, and Subscripts

public class TrackedString {
    public private(set) var numberOfEdits = 0
    public var value: String = "" {
        didSet {
            numberOfEdits++
        }
    }
    public init() {}
}


var stringToEdit = TrackedString()
stringToEdit.value = "This string will be tracked."
stringToEdit.value += " This edit will increment numberOfEdits."
stringToEdit.value += " So will this one."
print("The number of edits is \(stringToEdit.numberOfEdits)")

//: [Next](@next)
