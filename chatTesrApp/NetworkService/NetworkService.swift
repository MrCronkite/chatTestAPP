//
//  Router.swift
//  chatTesrApp
//
//  Created by admin1 on 25.03.23.
//

import UIKit

enum NetworkType {
    case code
    case registerUser
    case sendCode
    case getUser
    case getToken
    case putUserData
    
    var baseUrl: String {
        return "https://plannerok.ru/api/v1/users/"
    }
    
    var path: String {
        switch self {
        case .code: return "check-auth-code/"
        case .registerUser: return "register/"
        case .getToken: return "refresh-token/"
        case .putUserData: return "me/"
        case .getUser: return "me/"
        case .sendCode: return "send-auth-code/"
        }
    }
    
    var request: URLRequest {
        let url = URL(string: path, relativeTo: URL(string: baseUrl)!)!
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        switch self {
        case .code:
            request.httpMethod = "POST"
            return request
        case .registerUser:
            request.httpMethod = "POST"
            return request
        case .sendCode:
            request.httpMethod = "POST"
            return request
        default:
            request.httpMethod = "GET"
            return request
        }
    }
}

class NetworkManager {
    static let shared = NetworkManager()
    
    public func restredUser(name: String, username: String, phoneNumber: String, completion: @escaping (RegistredUser) -> Void) {
        var params = ["phone": phoneNumber, "name": name, "username": username]
        
        var request = NetworkType.registerUser.request
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: params as Any, options: JSONSerialization.WritingOptions())
            let task = URLSession.shared.dataTask(with: request as URLRequest as URLRequest, completionHandler: {(data, response, error) in
                if let data = data {
                    do{
                        guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) else { return }
                        guard let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else { return }
                        guard let jsonDecoded = try? JSONDecoder().decode(RegistredUser.self, from: jsonData) else { print("error 400"); return }
                        completion(jsonDecoded)
                    }
                }
            })
            task.resume()
        }catch _ {
            print ("Oops something happened buddy")
        }
    }
    
    public func checkCode(code: String, phoneNumber: String, completion: @escaping (CheckAuthCode) -> Void) {
        var params = ["phone": phoneNumber, "code": code]
        
        var request = NetworkType.registerUser.request
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: params as Any, options: JSONSerialization.WritingOptions())
            let task = URLSession.shared.dataTask(with: request as URLRequest as URLRequest, completionHandler: {(data, response, error) in
                if let data = data {
                    do{
                        guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) else { return }
                        guard let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else { return }
                        guard let jsonDecoded = try? JSONDecoder().decode(CheckAuthCode.self, from: jsonData) else { print("error 400"); return }
                        completion(jsonDecoded)
                    }
                }
            })
            task.resume()
        }catch _ {
            print ("Oops something happened buddy")
        }
    }
    
    
}



