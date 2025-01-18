//
//  ProductListUseCase.swift
//  beymen-case-study
//
//  Created by Ayşe Nur Nimetoğlu on 18.01.2025.
//

import Foundation
import Alamofire

struct ProductListUseCase {
    func request(page: Int, completion: @escaping (Result<[Product], Error>) -> Void) {
        let endpoint = ApiEndpointContainer.productListEndpoint(page: page)
        
        NetworkManager.shared.request(endpoint: endpoint) { result in
            switch result {
            case .success(let responseModel):
                completion(.success(responseModel.products))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
