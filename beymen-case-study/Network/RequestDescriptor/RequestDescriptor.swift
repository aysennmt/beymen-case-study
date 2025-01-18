//
//  RequestDescriptor.swift
//  beymen-case-study
//
//  Created by Ayşe Nur Nimetoğlu on 18.01.2025.
//

import Foundation
import Alamofire

/// Request DSL struct  used to construct a request and handle its response
final class RequestDescriptor<RequestBody: Encodable, ResponseBody: Decodable> {
    /// Base URL of the request
    let baseURL: String
    /// Path for the API endpoint
    let path: String
    /// HTTP method (GET, POST, etc.)
    let method: HTTPMethod
    /// Parameter encoding type (e.g., JSON or URL encoding)
    let encoding: ParameterEncoding
    
    init(
        baseURL: String,
        path: String,
        method: HTTPMethod,
        encoding: ParameterEncoding = URLEncoding.default
    ) {
        self.baseURL = baseURL
        self.path = path
        self.method = method
        self.encoding = encoding
    }
}

