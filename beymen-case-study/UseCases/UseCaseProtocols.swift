//
//  UseCaseProtocols.swift
//  beymen-case-study
//
//  Created by Ayşe Nur Nimetoğlu on 18.01.2025.
//

import Foundation

protocol UseCaseProtocol {
    associatedtype Parameters
    associatedtype Response
    func request(parameters: Parameters, completion: @escaping (Result<Response, Error>) -> Void)
}
