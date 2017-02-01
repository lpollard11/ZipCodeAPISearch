//
//  EndpointConstructor.swift
//  Pods
//
//  Created by Lee Pollard on 1/31/17.
//
//

import Foundation

/// The EndpointConstructor is used to conveniently construct the necessary endpoint for the zip code search.
open class EndpointConstructor: EndpointConstructionProtocol {
    
    public var baseUrl = "https://www.zipcodeapi.com/rest/"
    public var responseFormat = ""
    public var units = ""
    public var apiKey = ""
    
    /// Initializes the EndpointConstructor using the required parameters.
    ///
    /// - Parameters:
    ///   - responseFormat: Response format that can either be JSON, XML, or CSV.
    ///   - units: Type of distance from the desired zip code that can either be degrees or radians.
    ///   - apiKey: Api Key used to authenticate the network request.
    public init(responseFormat: ResponseFormat, units: Units, apiKey: String) {
        self.responseFormat = format(responseFormat.rawValue)
        self.units = units.rawValue
        self.apiKey = addSlash(apiKey)
    }
    
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

