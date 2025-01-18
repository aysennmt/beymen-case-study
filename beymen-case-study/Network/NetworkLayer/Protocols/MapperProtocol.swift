//
//  MapperProtocol.swift
//  beymen-case-study
//
//  Created by Ayşe Nur Nimetoğlu on 18.01.2025.
//

import Foundation

protocol MapperProtocol {
    associatedtype ResponseModel
    associatedtype UIModel
    
    static func mapFrom(responseModel: ResponseModel) -> UIModel
}
