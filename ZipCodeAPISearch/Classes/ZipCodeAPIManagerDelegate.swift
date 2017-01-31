//
//  ZipCodeAPIManagerDelegate.swift
//  Pods
//
//  Created by Lee Pollard on 1/30/17.
//
//

import Foundation

@objc public protocol ZipCodeAPIManagerDelegate {
    
    /// Handles the result of the zip code search by accepting a Location object and Error object.
    ///
    /// - Parameters:
    ///   - location: Location object with location data from zip code search.
    ///   - error: Error object from zip code search.
    func handleZipCodeResult(_ location: Location?, error: Error?)
}
