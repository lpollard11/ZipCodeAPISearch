//
//  Location.swift
//  Pods
//
//  Created by Lee Pollard on 1/31/17.
//
//

import Foundation
import Gloss

/// The Location object contains all the data returned by the ZipCodeAPI.
public class Location: NSObject, Decodable {
    
    /// Zip code of the location.
    var zipCode: String?
    
    /// Latitude of the location. Ex: "40.798605".
    var latitude: CGFloat?
    
    /// Longitude of the location. Ex: "-73.966557".
    var longitude: CGFloat?
    
    /// City of the location. Ex: "New York".
    var city: String?
    
    /// State of the location. Ex: "NY".
    var state: String?
    
    /// Time zone object of the location.
    var timeZone: TimeZone?
    
    /// Array of city objects.
    var cities: [City]?
    
    public required init?(json: JSON) {
        zipCode = "zip_code" <~~ json
        latitude = "lat" <~~ json
        longitude = "lng" <~~ json
        city = "city" <~~ json
        state = "state" <~~ json
        timeZone = "timezone" <~~ json
        cities = "acceptable_city_names" <~~ json
    }
}
