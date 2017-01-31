//
//  TimeZone.swift
//  Pods
//
//  Created by Lee Pollard on 1/31/17.
//
//

import Foundation
import Gloss

/// The TimeZone Gloss object contains time zone data.
public class TimeZone: Decodable {
    
    /// Time zone identifier. Ex: "America/New_York".
    var timezoneIdentifier: String?
    
    /// Time zone abbreviation. Ex: "EST".
    var timezoneAbbr: String?
    
    /// UTC Offset in seconds. Ex: "-18000".
    var utcOffsetSec: Int?
    
    /// Is the location DST.
    var isDst: String?
    
    public required init(json: JSON) {
        timezoneIdentifier = "timezone_identifier" <~~ json
        timezoneAbbr = "timezone_abbr" <~~ json
        utcOffsetSec = "utc_offset_sec" <~~ json
        isDst = "is_dst" <~~ json
    }
}
