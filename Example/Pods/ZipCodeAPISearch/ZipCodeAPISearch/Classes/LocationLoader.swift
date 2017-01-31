//
//  LocationLoader.swift
//  Pods
//
//  Created by Lee Pollard on 1/30/17.
//
//

import Foundation
import Gloss
import Alamofire

/// The LocationLoader performs a location data request using an endpoint constructed with the desired zip code.
open class LocationLoader {
    
    fileprivate var networkingManager: NetworkingProtocol = NetworkingManager()
    
    fileprivate var endPointConstructor: EndpointConstructor
    
    /// Initializes the LocationLoader with the required data to construct the endpoint used to fetch the location.
    ///
    /// - Parameters:
    ///   - responseFormat: Response format that can either be JSON, XML, or CSV.
    ///   - units: Type of distance from the desired zip code that can either be degrees or radians.
    ///   - apiKey: Api Key used to authenticate the network request.
    init(responseFormat: String, units: String, apiKey: String) {
        endPointConstructor = EndpointConstructor(responseFormat: responseFormat, units: units, apiKey: apiKey)
    }
    
    /// Performs a network call using the networking manager to fetch location data from an incoming zip code.
    ///
    /// - Parameters:
    ///   - zipCode: Zip code string used in the fetch.
    ///   - completion: Completion block to be fired when the network call finishes.
    open func loadLocation(_ zipCode: String, completion: @escaping (_ location: Location?, _ error: Error?) -> ()) {
        let endPoint = endPointConstructor.zipCodeEndpoint(zipCode)
        
        networkingManager.request(endPoint) { (response: DataResponse<Any>?, error: Error?) in
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            guard let results = response?.value as? JSON, let location = Location(json: results) else {
                completion(nil, nil)
                return
            }
            
            completion(location, nil)
        }
    }
}
