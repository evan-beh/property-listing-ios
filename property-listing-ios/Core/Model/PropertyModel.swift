//
//  PropertyModel.swift
//  property-listing-ios
//
//  Created by Evan Beh on 06/11/2021.
//

import UIKit

struct PropertyDetail : Codable
{
    let label: String!
    let text: String!

    enum CodingKeys: String, CodingKey {
       case label,text
    }
}


struct MapCoordinates : Codable
{
    let lat: Double!
    let lng: Double!

    enum CodingKeys: String, CodingKey {
       case lat,lng
    }
}

struct Address : Codable
{
    
        let district: String?
        let street_name: String?
        let map_coordinates : MapCoordinates?
        let subtitle: String?
        let title: String?


        enum CodingKeys: String, CodingKey {
           case district,street_name, map_coordinates, subtitle, title
        }
    
}

struct Attributes : Codable{

    let area_size: Int!
    let bathrooms: Int!
    let bedrooms: Int!
    let price: Int!
   
    enum CodingKeys: String, CodingKey {
       case area_size,bathrooms,bedrooms,price
    
    }
}

struct PropertyModel: Codable {

    let address: Address?
    let attributes: Attributes?
   
    let category: String?
    let completed_at: String?
    let id: Int?
    let photo: String?
    let project_name: String?
    let tenure: Int?
    let description: String?
    let property_details: [PropertyDetail]?

        enum CodingKeys: String, CodingKey {
           case address,attributes,category,completed_at,id,photo,project_name,tenure,description,property_details
        }
    
}


extension PropertyModel: Hashable {
    struct Diffable {
        let id: UUID

    }
    
    static func == (lhs: PropertyModel, rhs: PropertyModel) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
