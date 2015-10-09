//: ## JSON Serialization
//: ----
//: [Previous](@previous)

import Foundation

//: JSON Data

let jsonString = "{ \"name\" : \"Ricardo\", \"born\" : 1985, \"likes\" : [ { \"item\" : \"Swift\" }, { \"item\" : \"Objective-C\" } ] }"
let data = jsonString.dataUsingEncoding(NSUTF8StringEncoding)

//: Serialization

let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! [String: AnyObject]

print(jsonDictionary["name"])
print(jsonDictionary["born"])

if let likes = jsonDictionary["likes"] as? [AnyObject] {
    if let likeItem = likes[0] as? [String: AnyObject] {
        print(likeItem["item"])
    }
}

//: [Next](@next)
