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
    
    public func createUser(_ firstName: String, lastName: String) {
        guard let userEntityDescription = NSEntityDescription.entity(forEntityName: "User", in: context) else { return }
        //let user = User(entity: userEntityDescription, insertInto: context)
//        user.firstName = firstName
//        user.lastName = lastName
        
        appDelegate.saveContext()
    }
    
    public func fetchUsers() -> [AnyObject] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        do { return (try? context.fetch(fetchRequest) as? [AnyObject]) ?? [] }
    }
    
//    public func fetchUser(_ email: String) -> AnyObject? {
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
//        do {
//            let users = try? context.fetch(fetchRequest) as? [AnyObject]
//            return users?.first(where: { $0.email == email }) 
//        }
//    }
    
    public func updataUser(with firstName: String, lastName: String, email: String, password: String ) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        do {
           // guard let users = try? context.fetch(fetchRequest) as? [AnyObject],
//        let user = users.first(where: {$0.email == email}) else { return }
//            user.lastName = lastName
//            user.firstName = firstName
        }
        
        appDelegate.saveContext()
    }
    
    public func deletAllUsers() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        do {
            let users = try? context.fetch(fetchRequest) as? [AnyObject]
           // users?.forEach { context.delete($0) }
        }
        
        appDelegate.saveContext()
    }

    public func deletUser(with email: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        do {
         //  guard let users = try? context.fetch(fetchRequest) as? [AnyObject],
         //        let user = users.first(where: {$0.email == email}) else { return }
         //   context.delete(user)
        }
        
        appDelegate.saveContext()
    }

    
}
