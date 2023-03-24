//
//  AppCoordinator.swift
//  chatTesrApp
//
//  Created by admin1 on 23.03.23.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    weak var coordinator: AppCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(code: Int) {
        
        let vc = SignInPageViewController()
        vc.coordinator = self
        if code == 1 {
            navigationController.pushViewController(vc, animated: false)
        } else {
            openTabBar()
        }
    }
    
    func openLoginPage() {
        let vc = LogInPageViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func openTabBar() {
        let tabBar = TabBarController()
        tabBar.coordinator = self
        navigationController.pushViewController(tabBar, animated: false)
    }
}
