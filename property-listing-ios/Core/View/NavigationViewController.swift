//
//  NavigationViewController.swift
//  property-listing-ios
//
//  Created by Evan Beh on 10/11/2021.
//

import UIKit

class NavigationController : UINavigationController {

    override var preferredStatusBarStyle : UIStatusBarStyle {

        if let topVC = viewControllers.last {
            //return the status property of each VC, look at step 2
            return topVC.preferredStatusBarStyle
        }

        return .default
        
    }
    
}
