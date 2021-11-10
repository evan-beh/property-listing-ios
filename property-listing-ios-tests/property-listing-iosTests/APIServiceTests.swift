//
//  APIServiceTests.swift
//  property-listing-iosTests
//
//  Created by Evan Beh on 10/11/2021.
//

import XCTest
@testable import property_listing_ios
import Combine

class APIServiceTests: XCTestCase {
    
    private var cancellables: [AnyCancellable] = []

    func testPropertyListingAPI() throws {
        
        //GIVEN
        let service: PropertyListAPIProtocol = MockPropertyAPIServices()
        
        //WHEN
       let result =  service.requestListing()
        
        let expectation = self.expectation(description: "property_count")

        var array:[PropertyModel]?
        result.sink(receiveCompletion: { (completion) in
               print(completion)
           }) { (dataObj) in
                               
               array = dataObj
            
               expectation.fulfill()

               
           }.store(in: &cancellables)
        
        // THEN
        waitForExpectations(timeout: 1.0, handler: nil)
        XCTAssertEqual(1, array?.count)
    }

}
