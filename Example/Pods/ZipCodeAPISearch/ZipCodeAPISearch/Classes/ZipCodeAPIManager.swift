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
open class ZipCodeAPIManager: ZipCodeAPIManagerProtocol {
    
    weak public var delegate: ZipCodeAPIManagerDelegate?
    
    public var locationLoader: LocationLoaderProtocol
     
    /// Initializes the ZipCodeAPIManager with the incoming objects.
    ///
    /// - Parameters:
    ///   - locationLoader: Location loader used to load the location.
    public init(locationLoader: LocationLoaderProtocol) {
        self.locationLoader = locationLoader
    }
    
    public func searchZipCode(_ zipCode: String) {
        locationLoader.loadLocation(zipCode) { [weak self] (location: Location?, error: Error?) in
            self?.delegate?.handleZipCodeResult(location, error: error)
        }
    }
}
