//
//  StorageManager.swift
//  chatTesrApp
//
//  Created by admin1 on 23.03.23.
//

import UIKit
import CoreData

//MARK: - CRUD
public final class CoreDataManager: NSObject {
    public static var shared = CoreDataManager()
    private override init() {}
    
    private var appDelegate: AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }
    
    private var context: NSManagedObjectContext {
        appDelegate.persistentContainer.viewContext
    }
    
    public func logCD(){
        if let url = appDelegate.persistentContainer.persistentStoreCoordinator.persistentStores.first?.url {
            print("db url - \(url)")
        }
    }
    
    public func createToken(_ refreshToken: String, accessToken: String) {
        guard let tokenEntityDescription = NSEntityDescription.entity(forEntityName: "AuthorizationToken", in: context) else { return }
        let token = AuthorizationToken(entity: tokenEntityDescription, insertInto: context)
        token.refreshToken = refreshToken
        token.accessToken = accessToken
        
        appDelegate.saveContext()
    }
    
    public func fetchTokens() -> [AnyObject] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "AuthorizationToken")
        do { return (try? context.fetch(fetchRequest) as? [AuthorizationToken]) ?? [] }
    }
    
    public func fetchToken(_ refreshToken: String) -> AnyObject? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "AuthorizationToken")
        do {
            let token = try? context.fetch(fetchRequest) as? [AuthorizationToken]
            return token?.first(where: { $0.refreshToken == refreshToken })
        }
    }
    
    public func updataToken(with refreshToken: String, accessToken: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "AuthorizationToken")
        do {
           guard let tokens = try? context.fetch(fetchRequest) as? [AuthorizationToken],
                 let token = tokens.first(where: {$0.refreshToken == refreshToken}) else { return }
            token.accessToken = accessToken
        }
        appDelegate.saveContext()
    }
    
    public func deletAllTokens() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "AuthorizationToken")
        do {
            let token = try? context.fetch(fetchRequest) as? [AuthorizationToken]
            token?.forEach { context.delete($0) }
        }
        
        appDelegate.saveContext()
    }

    public func deletUser(with refreshToken: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "AuthorizationToken")
        do {
           guard let tokens = try? context.fetch(fetchRequest) as? [AuthorizationToken],
                 let token = tokens.first(where: {$0.refreshToken == refreshToken}) else { return }
            context.delete(token)
        }
        
        appDelegate.saveContext()
    }

    
}
