//
//  RequestDescriptorConvertable.swift
//  beymen-case-study
//
//  Created by Ayşe Nur Nimetoğlu on 18.01.2025.
//

import Foundation

protocol RequestDescriptorConvertable {
    associatedtype RequestBody: Encodable
    associatedtype ResponseBody: Decodable
    
    var descriptor: RequestDescriptor<RequestBody, ResponseBody> { get }
}
