//
//  City.swift
//  Pods
//
//  Created by Lee Pollard on 1/31/17.
//
//

import Foundation
import Gloss

/// The City object contains city data of the location.
open class City: Decodable {
    
    /// City name of the city object. Ex: "Manhattan"
    var city: String?
    
    /// State name of the city object. Ex: "NY"
    var state: String?
    
    public required init(json: JSON) {
        city = "city" <~~ json
        state = "state" <~~ json
    }
}
