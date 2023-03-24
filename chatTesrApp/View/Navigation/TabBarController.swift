//
//  TabBarController.swift
//  chatTesrApp
//
//  Created by admin1 on 23.03.23.
//

import UIKit

enum Tabs: Int, CaseIterable {
    case chats
    case profile
}

final class TabBarController: UITabBarController {
    
    weak var coordinator: AppCoordinator?

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        configureAppearance()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureAppearance()
    }

    private func configureAppearance() {
        tabBar.tintColor = Resouces.Colors.text
        tabBar.barTintColor = Resouces.Colors.active
        tabBar.backgroundColor = Resouces.Colors.active
        tabBar.layer.cornerRadius = 25
        tabBar.layer.masksToBounds = true
        tabBar.layer.borderWidth = 0.2
        tabBar.layer.borderColor = Resouces.Colors.text.cgColor

        let controllers: [NavBarController] = Tabs.allCases.map { tab in
            let controller = NavBarController(rootViewController: getController(for: tab))
            controller.tabBarItem = UITabBarItem(title: Resouces.Strings.TabBar.title(for: tab),
                                                 image: Resouces.ImagesBar.TabBar.icon(for: tab),
                                                 tag: tab.rawValue)
            return controller
        }

        setViewControllers(controllers, animated: false)
    }

    private func getController(for tab: Tabs) -> UIViewController {
        switch tab {
        case .chats: return ChatsViewController()
        case .profile: return SignInPageViewController()
        }
    }
}
