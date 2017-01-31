//
//  ResponseFormat.swift
//  Pods
//
//  Created by Lee Pollard on 1/30/17.
//
//

import Foundation

/// Possible response formats that will be used to construct the endpoint used in the zip code fetch.
///
/// - json: JSON format.
/// - xml: XML format.
/// - csv: CSV format.
public enum ResponseFormat: String {
    case json = "json/"
    case xml = "xml/"
    case csv = "csv/"
}
