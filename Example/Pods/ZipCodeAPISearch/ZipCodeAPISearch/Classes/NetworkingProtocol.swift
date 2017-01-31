//
//  NetworkingProtocol.swift
//  Pods
//
//  Created by Lee Pollard on 1/31/17.
//
//

import Foundation
import Alamofire

public protocol NetworkingProtocol {
    
    /// Request method that can be implemented using the Alamofire library.
    ///
    /// - Parameters:
    ///   - endPoint: Endpoint used in request.
    ///   - completion: Completion to be fired at end of network call.
    func request(_ endPoint: String, completion: @escaping (_ response: DataResponse<Any>?, _ error: Error?) -> ())
}
