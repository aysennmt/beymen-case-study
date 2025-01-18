//
//  NetworkManager.swift
//  beymen-case-study
//
//  Created by Ayşe Nur Nimetoğlu on 18.01.2025.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    
    func request<RequestBody: Encodable, ResponseBody: Decodable>(
        endpoint: Endpoint<RequestBody, ResponseBody>,
        parameters: RequestBody? = nil,
        completion: @escaping (Result<ResponseBody, Error>) -> Void
    ) {
        let url = endpoint.baseURL + endpoint.path
        
        var encodedParameters: [String: Any]?
        if let parameters = parameters {
            do {
                let jsonData = try JSONEncoder().encode(parameters)
                encodedParameters = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [String: Any]
            } catch {
                completion(.failure(error))
                return
            }
        }
        
        AF.request(url, method: endpoint.method, parameters: encodedParameters, encoding: endpoint.encoding)
            .validate()
            .responseDecodable(of: ResponseBody.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
