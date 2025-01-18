//
//  ProductListInteractor.swift
//  beymen-case-study
//
//  Created by Ayşe Nur Nimetoğlu on 18.01.2025.
//

import Foundation

class ProductListInteractor {
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
}

extension ProductListInteractor: ProductListInteractorInterface {
    
    func request(page: Int, categoryId: Int, completion: @escaping (Result<ProductListUIModel, Error>) -> Void) {
        ProductListUseCase().request(page: page, categoryId: categoryId, completion: completion)
    }
}

