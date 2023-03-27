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
    
    var accesToken: String{
        let token = CoreDataManager.shared.fetchToken("888899") as! String
        print(token)
        return token
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
        switch self {
        case .code:
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            return request
        case .registerUser:
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            return request
        case .sendCode:
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            return request
        case .getToken:
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            return request
        case .getUser:
            request.httpMethod = "GET"
            request.addValue("Bearer \(accesToken)", forHTTPHeaderField: "Authorization")
            return request
        case .putUserData:
            request.httpMethod = "PUT"
            request.addValue("Bearer \(accesToken)", forHTTPHeaderField: "Authorization")
            return request
        }
    }
}

class NetworkManager {
    static let shared = NetworkManager()
    
    public func registredUser(name: String, username: String, phoneNumber: String, completion: @escaping (RegistredUser) -> Void) {
        let params = ["phone": phoneNumber, "name": name, "username": username]
        
        var request = NetworkType.registerUser.request
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: params as Any, options: JSONSerialization.WritingOptions())
            let task = URLSession.shared.dataTask(with: request as URLRequest as URLRequest, completionHandler: {(data, response, error) in
                if let data = data {
                    do{
                        guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) else { return }
                        guard let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else { return }
                        guard let jsonDecoded = try? JSONDecoder().decode(RegistredUser.self, from: jsonData) else {
                            completion(RegistredUser.init(refreshToken: "", accessToken: "", userID: 0))
                            return }
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
        let params = ["phone": phoneNumber, "code": code]
        
        var request = NetworkType.code.request
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: params as Any, options: JSONSerialization.WritingOptions())
            let task = URLSession.shared.dataTask(with: request as URLRequest as URLRequest, completionHandler: {(data, response, error) in
                if let data = data {
                    do{
                        guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) else { return }
                        guard let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else { return }
                        guard let jsonDecoded = try? JSONDecoder().decode(CheckAuthCode.self, from: jsonData) else {
                            completion(CheckAuthCode.init(refreshToken: "", accessToken: "", userID: 0, isUserExists: false))
                            return
                        }
                        completion(jsonDecoded)
                    }
                }
            })
            task.resume()
        }catch _ {
            print ("Oops something happened buddy")
        }
    }
    
    public func sendCode(phoneNumber: String, completion: @escaping (Code) -> Void) {
        let params = ["phone": phoneNumber]
        
        var request = NetworkType.sendCode.request
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: params as Any, options: JSONSerialization.WritingOptions())
            let task = URLSession.shared.dataTask(with: request as URLRequest as URLRequest, completionHandler: {(data, response, error) in
                if let data = data {
                    do{
                        guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) else { return }
                        guard let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else { return }
                        guard let jsonDecoded = try? JSONDecoder().decode(Code.self, from: jsonData) else { print("error 400"); return }
                        completion(jsonDecoded)
                    }
                }
            })
            task.resume()
        }catch _ {
            print ("Oops something happened buddy")
        }
    }
    
    public func getToken() {
        let params = ["refresh_token": "123"]
        
        var request = NetworkType.getToken.request
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: params as Any, options: JSONSerialization.WritingOptions())
            request.httpBody = try JSONSerialization.data(withJSONObject: params as Any, options: JSONSerialization.WritingOptions())
            let task = URLSession.shared.dataTask(with: request as URLRequest as URLRequest, completionHandler: {(data, response, error) in
                if let data = data {
                    do{
                        guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) else { return }
                        guard let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else { return }
                        guard let jsonDecoded = try? JSONDecoder().decode(Token.self, from: jsonData) else { print("401"); return }
                        print(jsonDecoded.accessToken)
                    }
                }
            })
            task.resume()
        }catch _ {
            print ("Oops something happened buddy")
        }
    }
    
    public func getUserData(completion: @escaping (User) -> Void) {
        let request = NetworkType.getUser.request
        do{
            let task = URLSession.shared.dataTask(with: request as URLRequest as URLRequest, completionHandler: {(data, response, error) in
                if let data = data {
                    do{
                        guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) else { return }
                        guard let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else { return }
                        guard let jsonDecoded = try? JSONDecoder().decode(User.self, from: jsonData) else {
                            self.getToken()
                            return }
                        completion(jsonDecoded)
                    }
                }
            })
            task.resume()
        }
    }
    
    
    
}



