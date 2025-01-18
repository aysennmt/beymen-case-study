//
//  ProductDetailPresenter.swift
//  beymen-case-study
//
//  Created by Ayşe Nur Nimetoğlu on 18.01.2025.
//

import Foundation

class ProductDetailPresenter: ProductDetailPresenterProtocol {
    
    private var product: ProductUIModel
    
    init(product: ProductUIModel) {
        self.product = product
    }
    
    func toggleFavoriteStatus() {
        // Favoriye ekleme/çıkarma işlemi
    }
}
