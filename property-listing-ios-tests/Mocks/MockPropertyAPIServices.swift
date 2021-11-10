//
//  MockPropertyAPIServices.swift
//  property-listing-iosTests
//
//  Created by Evan Beh on 10/11/2021.
//

import UIKit
import Combine

@testable import property_listing_ios

class MockPropertyAPIServices: PropertyListAPIProtocol {

    func requestListing()->Future<[PropertyModel], Error>
    {
        
        return Future<[PropertyModel],Error> { promise in
       
            // mocking from json. enhancement can be done using mock framework
            let data = readLocalFile(forName: "listing")
            let userList = try! JSONDecoder().decode([PropertyModel].self, from: data!)

            
            promise(.success(userList))


        }

        
        
    }
    
    func requestDetails(with ID:Int) -> Future<PropertyModel, Error>
    {
        
        return Future<PropertyModel,Error> { promise in
       
            let apple = readLocalFile(forName: "listing")
                        print (apple)
        }
    }

    
}
