//
//  Router.swift
//  chatTesrApp
//
//  Created by admin1 on 25.03.23.
//

import UIKit

protocol NetworkProtocol {
    func postPhoneCode(phoneNumber: String)
    func postCheckCode(phoneNumber: String, code: Int)
    func postRegister(phoneNumber: String, name: String, username: String)
    
    func getUser()
    
}


final class NetworkManger: NetworkProtocol {
    public enum Urls {
        static var checkAuthCode = "https://plannerok.ru/api/v1/users/check-auth-code/"
        static var sendAuthCode = "https://plannerok.ru/api/v1/users/send-auth-code/"
    }
    
    func postPhoneCode(phoneNumber: String) {
        let session = URLSession.shared
        let url = Urls.sendAuthCode
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        var params :[String: Any]?
        params = ["phone": phoneNumber]
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: params as Any, options: JSONSerialization.WritingOptions())
            let task = session.dataTask(with: request as URLRequest as URLRequest, completionHandler: {(data, response, error) in
                if let response = response {
                    let nsHTTPResponse = response as! HTTPURLResponse
                    let statusCode = nsHTTPResponse.statusCode
                    print ("status code = \(statusCode)")
                }
                if let error = error {
                    print ("\(error)")
                }
                if let data = data {
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions())
                        print ("data = \(jsonResponse)")
                    }catch _ {
                        print ("OOps not good JSON formatted response")
                    }
                }
            })
            task.resume()
        }catch _ {
            print ("Oops something happened buddy")
        }
    }
    
    func postCheckCode(phoneNumber: String, code: Int) {
        let session = URLSession.shared
        let url = Urls.checkAuthCode
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        var params :[String: Any]?
        params = ["phone": phoneNumber,
                  "code": code]
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: params as Any, options: JSONSerialization.WritingOptions())
            let task = session.dataTask(with: request as URLRequest as URLRequest, completionHandler: {(data, response, error) in
                if let response = response {
                    let nsHTTPResponse = response as! HTTPURLResponse
                    let statusCode = nsHTTPResponse.statusCode
                    print ("status code = \(statusCode)")
                }
                if let error = error {
                    print ("\(error)")
                }
                if let data = data {
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions())
                        print ("data = \(jsonResponse)")
                    }catch _ {
                        print ("OOps not good JSON formatted response")
                    }
                }
            })
            task.resume()
        }catch _ {
            print ("Oops something happened buddy")
        }
    }
    
    func postRegister(phoneNumber: String, name: String, username: String) {
        <#code#>
    }
    
    func getUser() {
        <#code#>
    }
    
}


