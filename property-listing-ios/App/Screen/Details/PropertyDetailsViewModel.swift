//
//  PropertyDetailsViewModel.swift
//  property-listing-ios
//
//  Created by Evan Beh on 09/11/2021.
//

import UIKit
import Combine

class PropertyDetailsViewModel: ViewModel {
   
    private let propID: Int

    private var subscriptions = Set<AnyCancellable>()

    @Published var dataSource : PropertyModel?
    
    var propertyAPIService: PropertyListAPIProtocol!

    init(propID: Int, service:PropertyListAPIProtocol = PropertyListAPIService()) {
        self.propID = propID
        self.propertyAPIService = service
    }
    
    func viewDidLoad() {
                 
        let result = propertyAPIService.requestDetails(with: propID)
         
         result.sink(receiveCompletion: { (completion) in
                print(completion)
            }) { (dataObj) in
                                
                self.dataSource = dataObj
                
            }.store(in: &subscriptions)
    }
    
    
    
    struct Input {
           
        
       }
    
    struct Output {
           
        
       }

}
