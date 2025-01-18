//
//  ErrorUIModel.swift
//  beymen-case-study
//
//  Created by Ayşe Nur Nimetoğlu on 18.01.2025.
//

import Foundation

struct ErrorUIModel: Error {
    let title: String?
    let message: String
    
    init(
        title: String?,
        message: String
    ) {
        self.title = title
        self.message = message
    }
}
