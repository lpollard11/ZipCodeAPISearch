//
//  NetworkingManager.swift
//  Pods
//
//  Created by Lee Pollard on 1/31/17.
//
//

import Foundation
import Alamofire

/// The NetworkingManager performs a general network call using the Alamofire library.
open class NetworkingManager: NetworkingProtocol {
    
    public init() {
    
    }
    
    /// Performs an Alamofire network request using the incoming parameters.
    ///
    /// - Parameters:
    ///   - endPoint: Endpoint used in the network request.
    ///   - completion: Completion block to be fired when the network request finishes.
    open func request(_ endPoint: String, completion: @escaping (_ response: DataResponse<Any>?, _ error: Error?) -> ()) {
        Alamofire.request(endPoint)
            .responseJSON(options: .allowFragments, completionHandler: { (response: DataResponse) in
                completion(response, response.error)
            })
    }
}
