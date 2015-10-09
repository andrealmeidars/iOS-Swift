//: ## REST Request
//: ----
//: [Previous](@previous)

import Foundation

//: Creating a Manager

class ServerManager {
    
    // Singleton
    static let sharedManager = ServerManager()
    private init() {}
    
    // Properties
    let baseUrl = "https://api.github.com/"
    var task: NSURLSessionDataTask?
    
    // Make Request
    func getReposInfo(query: String) {
        
        // URL
        let apiUrl = baseUrl + query
        
        // Request
        let request = NSMutableURLRequest(URL: NSURL(string: apiUrl)!)
        request.HTTPMethod = "GET"
        
        // Session
        let session = NSURLSession.sharedSession()
        
        // Cancel Previous Task
        if self.task != nil {
            self.task!.cancel()
        }
        
        // Task
        self.task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            
            // Check error
            if error == nil {
                
                // Get Data
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! [String: AnyObject]
                    print(json)
                }
                catch let error as NSError {
                    print("A JSON parsing error occurred: \(error)")
                }
                
            } else {
                print("Error on Reuqest Task: \(error)")
            }
        }
        task!.resume()
    }
}

//: Executing and Canceling

let query = "repos/ricardorauber/iOS-Swift"
ServerManager.sharedManager.getReposInfo(query)
// ServerManager.sharedManager.task!.cancel() // Cancel Task

//: [Next](@next)
