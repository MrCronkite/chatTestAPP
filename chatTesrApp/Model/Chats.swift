//
//  Chats.swift
//  chatTesrApp
//
//  Created by admin1 on 24.03.23.
//

import UIKit

struct Chats {
    let name: String
    let description: String
    let interests: Interests
    
}

enum Interests {
    case business
    case entertainment
}

//struct ImageName {
//    static let person = "person"
//    static let fillPerson = "person.fill"
//}

struct Description {
    static let descriptionBuisiness = "something on business"
    static let descriptionEntertaiment = "something is not right"
}

struct Source {
    static func makeContacts() -> [Chats] {
        [
            .init(name: "Bob", description: Description.descriptionBuisiness, interests: .business),
            .init(name: "Alex", description: Description.descriptionBuisiness, interests: .business),
            .init(name: "Andrey", description: Description.descriptionBuisiness, interests: .business),
            .init(name: "Brucli", description: Description.descriptionBuisiness, interests: .business),
            .init(name: "Bramsi", description: Description.descriptionBuisiness, interests: .business),
            .init(name: "Billi", description: Description.descriptionBuisiness, interests: .business),
            
            .init(name: "Mari", description: Description.descriptionEntertaiment, interests: .entertainment),
            .init(name: "Olga", description: Description.descriptionEntertaiment, interests: .entertainment),
            .init(name: "Sveta", description: Description.descriptionEntertaiment, interests: .entertainment),
            .init(name: "Lera", description: Description.descriptionEntertaiment, interests: .entertainment),
            .init(name: "Nastia", description: Description.descriptionEntertaiment, interests: .entertainment),
            .init(name: "Violeta", description: Description.descriptionEntertaiment, interests: .entertainment),
            .init(name: "Katia", description: Description.descriptionEntertaiment, interests: .entertainment),
        ]
    }
    
    static func makeContactsWithGroup() -> [[Chats]] {
        let male = makeContacts().filter {$0.interests == .business}
        let female = makeContacts().filter {$0.interests == .entertainment}
        return [male, female]
    }
}
