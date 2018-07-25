//
//  Company.swift
//  CodableProtocol
//
//  Created by Gautam arora on 7/25/18.
//  Copyright © 2018 Gautamarora. All rights reserved.
//
import Foundation
import UIKit
/**************Comapny Structure that confirms to Codable Protocol**************/
struct Company:Codable {
    // Double, String, and Int all conform to Codable.
    var name:String = ""
    var foundingYear:Int = 0
    
    // Adding custom property that conforms to the Codable
    var location:Coordinates = Coordinates(latitude: 12.0000, longitude: 77.0000)
    //Built-in types such as Array, Dictionary, and Optional also conform to Codable.
    var webSite:URL? = nil// optional type
    var subLocations:[Locations] = [Locations]() // array
    var information:[String:String]? = [String:String]() //dictionary
    var services:Services = .Mobile //enum type
    
    enum CodingKeys: String, CodingKey{

        case name = "company_name"
        case foundingYear = "founding_date"
        case location
        case webSite = "company_website"
        case subLocations
        case information
        case services

    }
}
/**************Custom Coordinates Structure that confirms to Codable Protocol**************/
struct Coordinates:Codable {
    var latitude:Double
    var longitude:Double
    
}
/**************Locations Structure that confirms to Codable Protocol**************/
struct Locations:Codable {
    var locationName:String
    var locationLat:Double
    var locationLong:Double
}
/**************Services Enumeration that confirms to Codable Protocol**************/
enum Services:String,Codable{
    
    case Mobile
    case IT
    case Management
    case Electronics
    
}
