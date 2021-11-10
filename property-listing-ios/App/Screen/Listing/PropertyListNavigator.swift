//
//  PropertyListNavigator.swift
//  property-listing-ios
//
//  Created by Evan Beh on 09/11/2021.
//

import UIKit


protocol PropertyListNavigator : AnyObject {
    /// Presents the movies details screen
    func showDetails(propID:Int)
}
