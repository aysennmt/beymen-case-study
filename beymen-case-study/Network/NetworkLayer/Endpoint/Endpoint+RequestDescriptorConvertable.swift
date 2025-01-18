//
//  Endpoint+RequestDescriptorConvertable.swift
//  beymen-case-study
//
//  Created by Ayşe Nur Nimetoğlu on 18.01.2025.
//

import Foundation

extension Endpoint {
    var descriptor: RequestDescriptor<RequestBody, ResponseBody> {
        .init(
            baseURL: baseURL,
            path: path,
            method: method,
            encoding: encoding
        )
    }
}
