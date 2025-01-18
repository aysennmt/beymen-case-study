//
//  ApiEndpointContainer.swift
//  beymen-case-study
//
//  Created by Ayşe Nur Nimetoğlu on 18.01.2025.
//

import Foundation
import Alamofire

struct ApiEndpointContainer {
    static let baseURL = "https://www.beymen.com"
    
    static func productListEndpoint(page: Int) -> Endpoint<EmptyRequest, ProductListResponseModel> {
        Endpoint(
            baseURL: baseURL,
            path: "/Mobile2/api/mbproduct/list?siralama=akillisiralama&categoryId=10020&includeDocuments=true&sayfa=\(page)",
            method: .get,
            encoding: URLEncoding.default
        )
    }
    
    static func productDetailEndpoint(productId: Int) -> Endpoint<EmptyRequest, ProductDetailResponseModel> {
        Endpoint(
            baseURL: baseURL,
            path: "/Mobile2/api/mbproduct/product?productid=\(productId)",
            method: .get,
            encoding: URLEncoding.default
        )
    }
}
