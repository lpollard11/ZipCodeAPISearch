//
//  ZipCodeAPIManagerProtocol.swift
//  Pods
//
//  Created by Lee Pollard  on 1/31/17.
//
//

import Foundation

public protocol ZipCodeAPIManagerProtocol {
    
    /// The delegate object that another object or view controller can use to respond to the result of the location fetch.
    weak var delegate: ZipCodeAPIManagerDelegate? { get set }
    
    /// The LocationLoader is in charge of using the endpoint constructor and the networking manager to load a location.
    var locationLoader: LocationLoaderProtocol { get set }
    
    /// Peforms a zip code search using the location loader object and the incoming zip code string. A delegate method
    /// then handles the result of the location fetch.
    ///
    /// - Parameter zipCode: Zip code string.
    func searchZipCode(_ zipCode: String)
}
