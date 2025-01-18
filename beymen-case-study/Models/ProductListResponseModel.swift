//
//  ProductListResponseModel.swift
//  beymen-case-study
//
//  Created by Ayşe Nur Nimetoğlu on 18.01.2025.
//

import Foundation

// MARK: - ProductListResponseModel
struct ProductListResponseModel: Decodable {
    let success: Bool
    let message: String?
    let result: ProductListResult
}

struct ProductListResult: Decodable {
    let productList: [ProductDetailResponseModel]
}

