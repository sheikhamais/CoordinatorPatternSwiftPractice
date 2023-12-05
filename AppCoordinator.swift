//
//  AppCoordinator.swift
//  CoordinatorPatterPracticeApp
//
//  Created by Amais Sheikh on 03/12/2023.
//

import UIKit

class AppCoordinator: Coordinator {
    
    private let window: UIWindow
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let home = HomeViewController()
        let navigation = UINavigationController(rootViewController: home)
        window.rootViewController = navigation
        window.makeKeyAndVisible()
    }
}
