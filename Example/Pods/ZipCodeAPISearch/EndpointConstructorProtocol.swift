//
//  EndpointConstructorProtocol.swift
//  Pods
//
//  Created by Lee Pollard  on 1/31/17.
//
//

import Foundation

public protocol EndpointConstructionProtocol {
    
    /// Base url of the endpoint included in all endpoints.
    var baseUrl: String { get set }
    
    /// Response format that will be added to the endpoint.
    var responseFormat: String { get set }
    
    /// Units string that will be added to the endpoint.
    var units: String { get set }
    
    
    /// API Key string that will give you access to the ZipCodeAPI.
    var apiKey: String { get set }
    
    /// Constructs the end point using the incoming zip code string.
    ///
    /// - Parameter zipCode: Zip code string.
    /// - Returns: String used as the endpoint.
    func zipCodeEndpoint(_ zipCode: String) -> String
}
