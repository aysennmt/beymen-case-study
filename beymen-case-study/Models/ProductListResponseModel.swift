//
//  ProductListResponseModel.swift
//  beymen-case-study
//
//  Created by Ayşe Nur Nimetoğlu on 18.01.2025.
//

import Foundation

// MARK: - ProductListResponseModel
struct ProductListResponseModel: Decodable {
    let products: [Product]
}

// MARK: - Product
struct Product: Decodable {
    let id: Int
    let name: String
    let price: Double
    let imageUrl: String
}

// MARK: - Product Detail
struct ProductDetailResponseModel: Decodable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageUrl: String
}

