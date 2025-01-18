//
//  UseCaseProtocols.swift
//  beymen-case-study
//
//  Created by Ayşe Nur Nimetoğlu on 18.01.2025.
//

import Foundation

typealias UseCaseResult<UIModel> = Result<UIModel, ErrorUIModel>
typealias UseCaseCompletion<UIModel> = (UseCaseResult<UIModel>) -> Void

protocol UseCaseProtocol {
    associatedtype Params
    associatedtype UIModel
    
    func request(parameters: Params, completion: @escaping UseCaseCompletion<UIModel>)
}
