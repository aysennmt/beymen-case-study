//
//  ProductDetailUsecase.swift
//  beymen-case-study
//
//  Created by Ayşe Nur Nimetoğlu on 18.01.2025.
//

import Foundation

struct ProductDetailUseCase {
    func request(productId: Int, completion: @escaping (Result<ProductDetailUIModel, Error>) -> Void) {
        let endpoint = ApiEndpointContainer.productDetailEndpoint(productId: productId)
        
        NetworkManager.shared.request(endpoint: endpoint) { result in
            switch result {
            case .success(let responseModel):
                let productDetailUIModel = ProductDetailUIModel.mapFrom(responseModel: responseModel)
                completion(.success(productDetailUIModel))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
