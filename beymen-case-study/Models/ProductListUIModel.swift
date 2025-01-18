//
//  ProductListUIModel.swift
//  beymen-case-study
//
//  Created by Ayşe Nur Nimetoğlu on 18.01.2025.
//

import Foundation

/// MARK: - ProductListUIModel
struct ProductListUIModel {
    let products: [ProductUIModel]
}

struct ProductUIModel {
    let productId: Int
    let displayName: String
    let brandName: String
    let imageUrl: String
    let price: Double
    let strikeThroughPrice: Double
    let isStrikeThroughPriceExist: Bool
    let discountRate: String?
}

extension ProductListUIModel {
    static func mapFrom(responseModel: ProductListResponseModel) -> Self {
        let products = responseModel.result.productList.compactMap { ProductUIModel.mapFrom(responseModel: $0) }
        return ProductListUIModel(products: products)
    }
}

extension ProductUIModel {
    static func mapFrom(responseModel: ProductDetailResponseModel) -> Self? {
        guard let firstImageUrl = responseModel.result.images.first?.images.first?.imageUrl else {
            return nil
        }

        return ProductUIModel(
            productId: responseModel.result.productId,
            displayName: responseModel.result.displayName,
            brandName: responseModel.result.brandName,
            imageUrl: firstImageUrl,
            price: responseModel.result.actualPrice,
            strikeThroughPrice: responseModel.result.strikeThroughPrice,
            isStrikeThroughPriceExist: responseModel.result.isStrikeThroughPriceExist,
            discountRate: responseModel.result.discountRateText
        )
    }
}
