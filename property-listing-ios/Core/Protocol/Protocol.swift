//
//  Protocol.swift
//  property-listing-ios
//
//  Created by Evan Beh on 09/11/2021.
//

import UIKit

protocol StoryboardInitializable {
    static var storyboardIdentifier: String { get }
    static var storyboardName: UIStoryboard.Storyboard { get }
    static func instantiateViewController() -> UIViewController
}
