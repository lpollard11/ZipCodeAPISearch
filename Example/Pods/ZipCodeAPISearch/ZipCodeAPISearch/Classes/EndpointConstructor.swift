//
//  EndpointConstructor.swift
//  Pods
//
//  Created by Lee Pollard on 1/31/17.
//
//

import Foundation

/// The EndpointConstructor is used to conveniently construct the necessary endpoint for the zip code search.
open class EndpointConstructor {
    
    fileprivate let baseUrl = "https://www.zipcodeapi.com/rest/"
    
    fileprivate var responseFormat = ""
    fileprivate var units = ""
    fileprivate var apiKey = ""
    
    /// Initializes the EndpointConstructor using the required parameters.
    ///
    /// - Parameters:
    ///   - responseFormat: Response format that can either be JSON, XML, or CSV.
    ///   - units: Type of distance from the desired zip code that can either be degrees or radians.
    ///   - apiKey: Api Key used to authenticate the network request.
    init(responseFormat: String, units: String, apiKey: String) {
        self.responseFormat = format(responseFormat)
        self.units = units
        self.apiKey = addSlash(apiKey)
    }
    
    /// Constructs the end point using the incoming zip code string.
    ///
    /// - Parameter zipCode: Zip code string.
    /// - Returns: String used as the endpoint.
    open func zipCodeEndpoint(_ zipCode: String) -> String {
        let zipCodeString = addSlash(zipCode)
        return baseUrl + apiKey + responseFormat + zipCodeString + units
    }
    
    fileprivate func format(_ format: String) -> String {
        return "info." + format
    }
    
    fileprivate func addSlash(_ string: String) -> String {
        return string + "/"
    }
}

