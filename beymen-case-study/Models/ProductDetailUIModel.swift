//
//  ProductDetailUIModel.swift
//  beymen-case-study
//
//  Created by Ayşe Nur Nimetoğlu on 18.01.2025.
//

import Foundation

// MARK: - ProductDetailUIModel
struct ProductDetailUIModel {
    let productId: Int
    let externalSystemCode: String
    let displayName: String
    let description: ProductDescriptionUIModel
    let brandName: String
    let actualPrice: Double
    let strikeThroughPrice: Double
    let discountRateText: String
    let images: [ProductImageUIModel]
    let categoryName: String
    let sellerName: String
    let sellerTitle: String
    let shareUrl: String
    let installmentInfo: InstallmentUIModel
}

struct ProductDescriptionUIModel {
    let features: String?
    let seasonYear: String?
    let fabricCare: String?
    let productCode: String?
}

struct ProductImageUIModel {
    let sizeCode: String
    let imageUrl: String
}

struct InstallmentUIModel {
    let warningText: String?
    let installmentCount: Int
}

extension ProductDetailUIModel {
    static func mapFrom(responseModel: ProductDetailResponseModel) -> Self {
        return ProductDetailUIModel(
            productId: responseModel.result.productId,
            externalSystemCode: responseModel.result.externalSystemCode,
            displayName: responseModel.result.displayName,
            description: ProductDescriptionUIModel.mapFrom(responseModel: responseModel.result.description),
            brandName: responseModel.result.brandName,
            actualPrice: responseModel.result.actualPrice,
            strikeThroughPrice: responseModel.result.strikeThroughPrice,
            discountRateText: responseModel.result.discountRateText,
            images: responseModel.result.images.map { ProductImageUIModel.mapFrom(responseModel: $0) },
            categoryName: responseModel.result.categoryName,
            sellerName: responseModel.result.seller.sellerName,
            sellerTitle: responseModel.result.seller.sellerTitle,
            shareUrl: responseModel.result.shareUrl,
            installmentInfo: InstallmentUIModel.mapFrom(responseModel: responseModel.result.installment)
        )
    }
}

extension ProductDescriptionUIModel {
    static func mapFrom(responseModel: ProductDescription) -> Self {
        return ProductDescriptionUIModel(
            features: responseModel.ozellikler,
            seasonYear: responseModel.yilSezon,
            fabricCare: responseModel.kumaşVeBakim,
            productCode: responseModel.urunKodu
        )
    }
}

extension ProductImageUIModel {
    static func mapFrom(responseModel: ProductImage) -> Self {
        guard let firstImage = responseModel.images.first else {
            return ProductImageUIModel(sizeCode: "", imageUrl: "")
        }
        return ProductImageUIModel(
            sizeCode: firstImage.sizeCode,
            imageUrl: firstImage.imageUrl
        )
    }
}


extension InstallmentUIModel {
    static func mapFrom(responseModel: Installment) -> Self {
        return InstallmentUIModel(
            warningText: responseModel.installmentWarningText,
            installmentCount: responseModel.installmentCount
        )
    }
}
