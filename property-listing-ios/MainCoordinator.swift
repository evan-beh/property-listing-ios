//
//  MainCoordinator.swift
//  property-listing-ios
//
//  Created by Evan Beh on 09/11/2021.
//

import UIKit


final class AppCoordinator : Coordinator{
    
    private var window : UIWindow?

    var coordinator : Coordinator!
    
    init(window : UIWindow, coord: Coordinator = ListCoordinator()) {
        self.window = window
        coordinator = coord

    }
    var listCoordinator : ListCoordinator!
    
    @discardableResult
    func start()->UIViewController{
        let mainVC = coordinator.start()
        self.window?.rootViewController = mainVC
        self.window?.makeKeyAndVisible()
        return mainVC
    }
}
