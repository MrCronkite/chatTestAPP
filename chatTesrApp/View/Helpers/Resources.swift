//
//  Resources.swift
//  chatTesrApp
//
//  Created by admin1 on 23.03.23.
//

import UIKit

enum Resouces {
    enum Colors {
        static var text = UIColor(hexString: "#161826")
        static var textFieldColorbg = UIColor(hexString: "#E8E8E8")
        static var textFieldColorText = UIColor(hexString: "#7B7B7B")
        static var btnColor = UIColor(hexString: "#4E55D7")
        static var subText = UIColor(hexString: "#808080")
        static var active = UIColor(hexString: "#EEEFF4")
    }
    
    enum Images {
        static var google = UIImage(named: "google")
        static var apple = UIImage(named: "apple")
    }
    
    enum Strings {
        enum TabBar {
            static func title(for tab: Tabs) -> String {
                switch tab {
                case .chats: return "All Chats"
                case .profile: return "Profile"
                }
            }
        }
    }
        
        enum ImagesBar {
            enum TabBar {
                static func icon(for tab: Tabs) -> UIImage? {
                    switch tab {
                    case .chats: return UIImage(named: "google")
                    case .profile: return UIImage(named: "apple")
                    }
                }
            }
        }
}
