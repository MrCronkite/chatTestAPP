//
//  AuthorizationToken+CoreDataProperties.swift
//  chatTesrApp
//
//  Created by admin1 on 27.03.23.
//
//

import Foundation
import CoreData

@objc(AuthorizationToken)
public class AuthorizationToken: NSManagedObject {

}

extension AuthorizationToken {
    @NSManaged public var accessToken: String?
    @NSManaged public var refreshToken: String?
}

extension AuthorizationToken : Identifiable {}
