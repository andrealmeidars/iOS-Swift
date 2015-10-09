//: ## Notification Center
//: ----
//: [Previous](@previous)

import Foundation

//: Adding and Removing Observer for a Notification

class Group : NSObject {
    
    override init() {
        super.init()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "gotNotification:", name: "SomeNotification", object: nil)
    }
    
    func gotNotification(notification: NSNotification) {
        print(notification.object)
    }
    
    func removeObserver() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "SomeNotification", object: nil)
    }
}

//: Posting a Notification

class Person : NSObject {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func doSomething() {
        NSNotificationCenter.defaultCenter().postNotificationName("SomeNotification", object: self.name)
    }
}

//: Executing

var group = Group()
var person = Person(name: "Ricardo")

// Post
person.doSomething()

// Remove
group.removeObserver()
person.doSomething()

//: [Next](@next)
