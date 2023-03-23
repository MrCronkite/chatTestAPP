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

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        configureAppearance()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureAppearance()
    }

    private func configureAppearance() {
        tabBar.tintColor = Resouces.Colors.btnColor
        tabBar.barTintColor = Resouces.Colors.subText
        tabBar.backgroundColor = .white
        tabBar.layer.cornerRadius = 10
        tabBar.layer.masksToBounds = true

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
        case .chats: return LogInPageViewController()
        case .profile: return SignInPageViewController()
        }
    }
}
