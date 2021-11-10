//
//  PropertyListingViewModel.swift
//  property-listing-ios
//
//  Created by Evan Beh on 06/11/2021.
//

import UIKit
import Combine

protocol PropertyListingViewModelCoordinator : AnyObject{
    func didTapOnRow(index:Int)
}

extension PropertyListingViewModel: PropertyListingViewModelCoordinator {
    
    func didTapOnRow(index:Int)
    {
        let item = listing[index]
        
        guard let id = item.id else {return}
        
        self.navigator?.showDetails(propID: id)

    }
}

class PropertyListingViewModel: ViewModel {
    
    private var subscriptions = Set<AnyCancellable>()

    @Published var listing = [PropertyModel]()
    
    var propertyAPIService: PropertyListAPIProtocol!

    private weak var navigator: PropertyListNavigator?

    init(navigator: PropertyListNavigator, service :PropertyListAPIProtocol = PropertyListAPIService()) {
        self.navigator = navigator
        self.propertyAPIService = service

    }
    
    
    func viewDidLoad() {
        
     let result = propertyAPIService.requestListing()
        
        result.sink(receiveCompletion: { (completion) in
               print(completion)
           }) { (dataObj) in
               
               print(dataObj)
               
               self.listing = dataObj
               
           }.store(in: &subscriptions)
        
        
        
        
        
        
        
    }
    
   

}
