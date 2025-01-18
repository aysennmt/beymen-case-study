//
//  ProductDetailResponseModel.swift
//  beymen-case-study
//
//  Created by Ayşe Nur Nimetoğlu on 18.01.2025.
//

import Foundation

// MARK: - ProductDetailResponseModel
struct ProductDetailResponseModel: Decodable {
    let success: Bool
    let message: String?
    let result: ProductDetailResult
}

struct ProductDetailResult: Decodable {
    let productId: Int
    let externalSystemCode: String
    let displayName: String
    let description: ProductDescription
    let estimatedSupplyDate: String?
    let brandName: String
    let actualPriceText: String
    let actualPrice: Double
    let isStrikeThroughPriceExist: Bool
    let strikeThroughPriceText: String
    let strikeThroughPrice: Double
    let discountRateText: String
    let isVatIncluded: Bool
    let vatRate: Double
    let hasHopiParacik: Bool
    let hopiParacikText: String?
    let isPreOrder: Bool
    let hasQuantitySelector: Bool
    let isCosmeticProduct: Bool
    let isBanned: Bool
    let isGiftCard: Bool
    let isAppWidgetNotShown: Bool
    let images: [ProductImage]
    let otherColorList: [String]
    let tagAttributes: String?
    let installment: Installment
    let contentUrl: ContentUrl
    let categoryLink: CategoryLink
    let brandLink: BrandLink
    let shareUrl: String
    let sizeSystem: String
    let gtmModel: GTMModel
    let categoryId: Int
    let categoryName: String
    let breadcrumbCategory: String
    let list: String
    let seller: Seller
    let maxProductQuantityCanSold: Int?
}

struct ProductDescription: Decodable {
    let ozellikler: String?
    let yilSezon: String?
    let kumaşVeBakim: String?
    let urunKodu: String?
}

struct ProductImage: Decodable {
    let displayOrder: Int
    let images: [ImageDetails]
}

struct ImageDetails: Decodable {
    let sizeCode: String
    let imageUrl: String
}

struct Installment: Decodable {
    let installmentWarningText: String?
    let hasInstallmentWarning: Bool
    let url: String
    let installmentCount: Int
}

struct ContentUrl: Decodable {
    let delivery: String
    let shipment: String
    let oneCard: String
    let sizeChartUrl: String
    let shipmentAndDelivery: String?
    let preOwnedStatus: String?
}

struct CategoryLink: Decodable {
    let url: String
    let displayName: String
}

struct BrandLink: Decodable {
    let url: String
    let displayName: String
}

struct GTMModel: Decodable {
    let pseas: String
    let pgen: String
    let pdsct: String
    let pother: String
    let pmaingroup: String
    let pproductgroup: String
    let pconsignment: String
    let pyear: String?
}

struct Seller: Decodable {
    let sellerName: String
    let sellerTitle: String
    let sellerCode: String?
}
