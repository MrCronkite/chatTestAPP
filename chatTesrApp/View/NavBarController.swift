//
//  TabBarController.swift
//  chatTesrApp
//
//  Created by admin1 on 23.03.23.
//

import UIKit

final class NavBarController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureAppearance()
    }

    private func configureAppearance() {
        view.backgroundColor = .white
        navigationBar.isTranslucent = false
    }
}
