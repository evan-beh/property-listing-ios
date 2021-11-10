//
//  PropertyDetailsCoordinator.swift
//  property-listing-ios
//
//  Created by Evan Beh on 09/11/2021.
//

import UIKit

class PropertyDetailsCoordinator: Coordinator{
    
    var navigationController: NavigationController!
    let propID: Int!

    init (id : Int, nav :NavigationController = NavigationController())
    {
        self.propID = id
        self.navigationController = nav
    }
    
   
    
    func start()->UIViewController{
        
    let detailVC = PropertyDetailsCoordinator.instantiateViewController() as! PropertyDetailsViewController
        let viewModel = PropertyDetailsViewModel(propID: propID)
        detailVC.viewModel = viewModel
        return detailVC
    }
}


extension PropertyDetailsCoordinator : StoryboardInitializable {
    static var storyboardName: UIStoryboard.Storyboard {
        return .main
    }
}

