//
//  ProductListUseCase.swift
//  beymen-case-study
//
//  Created by Ayşe Nur Nimetoğlu on 18.01.2025.
//

import Foundation
import Alamofire

struct ProductListUseCase {
    func request(page: Int, categoryId: Int = 10020, completion: @escaping (Result<ProductListUIModel, Error>) -> Void) {
        let endpoint = ApiEndpointContainer.productListEndpoint(page: page, categoryId: categoryId)
        
        NetworkManager.shared.request(endpoint: endpoint) { result in
            switch result {
            case .success(let responseModel):
                let uiModel = ProductListUIModel.mapFrom(responseModel: responseModel)
                completion(.success(uiModel))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
