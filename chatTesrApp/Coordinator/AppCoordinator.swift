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
    
    func start() {
        let vc = SignInPageViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func openLoginPage() {
        let vc = LogInPageViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
