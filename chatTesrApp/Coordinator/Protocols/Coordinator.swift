//
//  Coordinator.swift
//  chatTesrApp
//
//  Created by admin1 on 23.03.23.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}
