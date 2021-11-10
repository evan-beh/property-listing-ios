//
//  ListCoordinator.swift
//  property-listing-ios
//
//  Created by Evan Beh on 09/11/2021.
//

import UIKit

class ListCoordinator: Coordinator {

     var rootViewController: NavigationController!
    var detailViewCoordinator : PropertyDetailsCoordinator!
        
    
    init (nav :NavigationController = NavigationController())
    {
        self.rootViewController = nav
    }
    
    func start()->UIViewController{
        
        let listVC = ListCoordinator.instantiateViewController() as! PropertyListingViewController
        
        rootViewController.viewControllers.append(listVC)

        let viewModel = PropertyListingViewModel(navigator: self)
       listVC.viewModel = viewModel

        return rootViewController
    }
}


extension ListCoordinator : StoryboardInitializable {
    static var storyboardName: UIStoryboard.Storyboard {
        return .main
    }
}

extension ListCoordinator: PropertyListNavigator {

    func showDetails(propID:Int) {
        
        detailViewCoordinator = PropertyDetailsCoordinator(id: propID, nav: self.rootViewController)
        
        let detailVC = detailViewCoordinator.start()
        
        rootViewController.pushViewController(detailVC, animated: true)

    }

}
