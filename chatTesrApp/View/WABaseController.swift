//
//  WABaseController.swift
//  WorkoutApp
//
//  Created by Viktor Prikolota on 23.05.2022.
//

import UIKit

enum NavBarPosition {
    case left
    case right
}

class WABaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        constraintViews()
        configureAppearance()
    }
}

@objc extension WABaseController {

    func setupViews() {}
    func constraintViews() {}

    func configureAppearance() {
    }

    func navBarLeftButtonHandler() {
        print("NavBar left button tapped")
    }

    func navBarRightButtonHandler() {
        print("NavBar right button tapped")
    }
}

extension WABaseController {
    func addNavBarButton(at position: NavBarPosition, with title: String) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)

        switch position {
        case .left:
            button.addTarget(self, action: #selector(navBarLeftButtonHandler), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(self, action: #selector(navBarRightButtonHandler), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
}
