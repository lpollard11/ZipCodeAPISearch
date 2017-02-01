//
//  LocationLoaderProtocol.swift
//  Pods
//
//  Created by Lee Pollard  on 1/31/17.
//
//

import Foundation

public protocol LocationLoaderProtocol {
    
    /// The networkingManager used to make the network call.
    var networkingManager: NetworkingProtocol { get set }
    
    /// The endPointConstructor used to create the endpoint for the network call.
    var endPointConstructor: EndpointConstructionProtocol { get set }
    
    /// Performs a network call using the networking manager to fetch location data from an incoming zip code.
    ///
    /// - Parameters:
    ///   - zipCode: Zip code string used in the fetch.
    ///   - completion: Completion block to be fired when the network call finishes.
    func loadLocation(_ zipCode: String, completion: @escaping (_ location: Location?, _ error: Error?) -> ())
}

