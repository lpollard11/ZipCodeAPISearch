//
//  EndpointConstructor.swift
//  Pods
//
//  Created by Lee Pollard on 1/31/17.
//
//

import Foundation

/// The EndpointConstructor is used to conveniently construct the necessary endpoint for the zip code search.
public class EndpointConstructor {
    
    private let baseUrl = "https://www.zipcodeapi.com/rest/"
    
    private var responseFormat = ""
    private var units = ""
    private var apiKey = ""
    
    /// Initializes the EndpointConstructor using the required parameters.
    ///
    /// - Parameters:
    ///   - responseFormat: Response format that can either be JSON, XML, or CSV.
    ///   - units: Type of distance from the desired zip code that can either be degrees or radians.
    ///   - apiKey: Api Key used to authenticate the network request.
    init(responseFormat: String, units: String, apiKey: String) {
        self.responseFormat = format(format: responseFormat)
        self.units = units
        self.apiKey = addSlash(string: apiKey)
    }
    
    /// Constructs the end point using the incoming zip code string.
    ///
    /// - Parameter zipCode: Zip code string.
    /// - Returns: String used as the endpoint.
    public func zipCodeEndpoint(zipCode: String) -> String {
        let zipCodeString = addSlash(string: zipCode)
        return baseUrl + apiKey + responseFormat + zipCodeString + units
    }
    
    private func format(format: String) -> String {
        return "info." + format
    }
    
    private func addSlash(string: String) -> String {
        return string + "/"
    }
}

