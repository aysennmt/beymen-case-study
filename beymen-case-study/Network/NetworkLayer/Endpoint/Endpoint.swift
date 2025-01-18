//
//  Endpoint.swift
//  beymen-case-study
//
//  Created by Ayşe Nur Nimetoğlu on 18.01.2025.
//

import Foundation
import Alamofire

struct Endpoint<RequestBody: Encodable, ResponseBody: Decodable>: Equatable {
    static func == (lhs: Endpoint<RequestBody, ResponseBody>, rhs: Endpoint<RequestBody, ResponseBody>) -> Bool {
        (lhs.baseURL == rhs.baseURL) && (lhs.path == rhs.path) && (lhs.method == rhs.method)
    }
    
    let baseURL: String
    let path: String
    let method: HTTPMethod
    let encoding: ParameterEncoding
}
