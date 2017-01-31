//
//  ZipCodeAPIManager.swift
//  Pods
//
//  Created by Lee Pollard on 1/30/17.
//
//

import Foundation
import UIKit

/// The ZipCodeAPIManager performs a location search with the incoming zip code using the public API called ZipCodeApi.
/// It also calls a delegate method to handle the result of the fetch which is a Gloss model.
open class ZipCodeAPIManager: NSObject {
    
    /// The delegate object that another object or view controller can use to respond to the result of the location fetch.
    open weak var delegate: ZipCodeAPIManagerDelegate!
    
    fileprivate var locationLoader: LocationLoader
    
    /// Initializes the ZipCodeAPIManager with the incoming necessary data for a network call to the ZipCodeApi.
    ///
    /// - Parameters:
    ///   - apiKey: Api Key used to authenticate the network request.
    ///   - responseFormat: Response format that can either be JSON, XML, or CSV.
    ///   - units: Type of distance from the desired zip code that can either be degrees or radians.
    public init(apiKey: String, responseFormat: ResponseFormat, units: Units) {
        self.locationLoader = LocationLoader(responseFormat: responseFormat.rawValue,
                                             units: units.rawValue,
                                             apiKey: apiKey)
    }
    
    /// Peforms a zip code search using the location loader object and the incoming zip code string. A delegate method
    /// then handles the result of the location fetch.
    ///
    /// - Parameter zipCode: Zip code string.
    open func searchZipCode(_ zipCode: String) {
        locationLoader.loadLocation(zipCode) { [weak self] (location: Location?, error: Error?) in
            self?.delegate.handleZipCodeResult(location, error: error)
        }
    }
}
