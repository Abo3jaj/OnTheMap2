//
//  ViewController.swift
//  OnTheMap
//
//  Created by omar Al-joundi on 4/9/20.
//  Copyright © 2020 omar Al-joundi. All rights reserved.
//

import UIKit
import Foundation
class OnTheMap {
    
    struct Auth {
      static var sessionId = ""
      static var accountId = 0
    }
    
    enum EndPoints {
        static let base = "https://onthemap-api.udacity.com/v1"
        
        
        case createSessionId
        case getMultipleStudents
        case getUserInfo(String)
        var stringValue : String {
            switch self {
            case .createSessionId : return EndPoints.base + "/session"
            case .getMultipleStudents : return EndPoints.base + "/StudentLocation"
            case .getUserInfo(let id) : return EndPoints.base + "/users/" + id
            }
        }
        
        var url:URL {
            return URL(string:stringValue)!
        }
        
    }
     
    class func login(username:String,password:String,completin:@escaping(PostSessionResponse?,Error?)->Void){
        var request = URLRequest(url: EndPoints.createSessionId.url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
      
        let body = LoginBody(udacity:LoginData(username: username, password: password))
      
        request.httpBody = try! JSONEncoder().encode(body)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                completin(nil,error)
                return
                
            }
            let range = (5..<data.count)
            let newData = data.subdata(in: range)
            print(String(data: newData, encoding: .utf8)!)
            let decoder = JSONDecoder()
            do{
            let responseObject = try decoder.decode(PostSessionResponse.self, from: newData)
                completin(responseObject,nil)
            }
            catch{
                
                 print(error.localizedDescription)
                completin(nil,error)
            }
        }
        task.resume()
        
        
    }
    
    
    class func getMultipleStudents(completion:@escaping([getMultipleStudentsResponse],Error?)->Void){
        let request = URLRequest(url: EndPoints.getMultipleStudents.url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                completion([],error)
                return
            }
            do{
              let decoder = JSONDecoder()
                let responseObject = try decoder.decode(studentResults.self, from: data)
                completion(responseObject.results,nil) // why there are names empty or has name it says "FirstName LastName is it normal?"
               
            }
            catch{
                print(error.localizedDescription)
                completion([],error)
            }
        }
        task.resume()
    
    }
    
    
    class func postStudentLocation(location:String,link:String ,completion:@escaping(Bool,Error?)->Void){
        var request = URLRequest(url:EndPoints.getMultipleStudents.url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let body = usersModel.results
        request.httpBody =  try! JSONEncoder().encode(body)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completion(false,error)
                return
              }
                   let decoder = JSONDecoder()
                   do{
                   _ = try decoder.decode(PostStudentLocationResponse.self, from: data)

                    completion(true,nil)
                   }
                   catch{
                       
                        print(error.localizedDescription)
                    
                       completion(false,error)
                   }
            
            }
        task.resume()
        }
    
    class func getUserInfo(userId:String,completion:@escaping(Bool,Error?)->Void){
        var request = URLRequest(url: EndPoints.getUserInfo(userId).url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        print(userId)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else { // Handle error...
              completion(false,error)
               return}
          
          let range = (5..<data.count)
          let newData = data.subdata(in: range)
            print(String(data: newData, encoding: .utf8)!)
            let decode = JSONDecoder()
            do {
            let responseObject = try decode.decode(getUsersInfo.self, from: newData)
            print(responseObject)
            }
            catch{
                print("Im here9")
                print(error.localizedDescription)
            }
         
        }
        task.resume()
    }
}
    
   
    
    
    
    
    
    

