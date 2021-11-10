//
//  CoordinatorTests.swift
//  property-listing-iosTests
//
//  Created by Evan Beh on 10/11/2021.
//

import XCTest
@testable import property_listing_ios

class CoordinatorTests: XCTestCase {

    private let window =  UIWindow()
    
    /// Test that application flow is started correctly
    func test_startsApplicationsFlow() {
        // GIVEN
        let rootViewController = NavigationController()
        
        let coordinator = ListCoordinator(nav:rootViewController)
        
        let appCoordinator = AppCoordinator(window:self.window,coord:coordinator)
        // WHEN
        appCoordinator.start()
        // THEN
        XCTAssertEqual(window.rootViewController, rootViewController)
    }

}
