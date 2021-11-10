//
//  PropertyListAPIService.swift
//  property-listing-ios
//
//  Created by Evan Beh on 06/11/2021.
//

import UIKit
import Alamofire
import Combine


// Main

protocol RequestBuilder {
    var urlString: String {get}
}



enum PropertyListAPI {
    case listing
    case details (id:Int)
}

protocol PropertyListAPIProtocol
{
    func requestListing()->Future<[PropertyModel], Error>
    func requestDetails(with ID:Int) -> Future<PropertyModel, Error>


}


class PropertyListAPIService: PropertyListAPIProtocol
{
    func requestDetails(with ID:Int) -> Future<PropertyModel, Error> {
            
        let api = PropertyListAPI.details(id:ID).urlString
        
            return Future<PropertyModel,Error> { promise in
                            
                let request = AF.request(api)
                            
                request.responseDecodable(of:PropertyModel.self) { (response) in
                    
                    print (response)
                    
                    switch response.result{
                                    case .failure(let Lerror):
                                        print(Lerror)
                                        promise(.failure(Lerror))
                                        break
                                    case .success(let dataObj):

                                        promise(.success(dataObj))
                                        break
                                
                    }
              
                }
           
            }
    }
    
    

    func requestListing() -> Future<[PropertyModel], Error> {
       
        let api = PropertyListAPI.listing.urlString
        
        return Future<[PropertyModel],Error> { promise in
                        
            let request = AF.request(api)
                        
            request.responseDecodable(of: [PropertyModel].self) { (response) in
                
                print (response)
                
                switch response.result{
                                case .failure(let Lerror):
                                    print(Lerror)
                                    promise(.failure(Lerror))
                                    break
                                case .success(let dataObj):

                                    promise(.success(dataObj))
                                    break
                                }
            }
        }

       
        
    }
    
    
    
}

extension PropertyListAPI: RequestBuilder{
    
    var urlString: String{
        
        switch self {
            
        case .listing:
            return "https://ninetyninedotco-b7299.asia-southeast1.firebasedatabase.app/listings.json"
        case .details(let id):
            return "https://ninetyninedotco-b7299.asia-southeast1.firebasedatabase.app/details/\(id).json"
        }
    }
    

   
}
