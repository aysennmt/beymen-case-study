//
//  ProductListInterfaces.swift
//  beymen-case-study
//
//  Created by Ayşe Nur Nimetoğlu on 18.01.2025.
//

import Foundation

protocol ProductListView: AnyObject {
    func populate(viewModel: ProductListUIModel)
    func showError(error: String)
    func appendProducts(product: [ProductUIModel])
}

protocol ProductListPresenterProtocol {
    func viewDidLoad()
    func loadMoreProduct(page: Int)
}


protocol ProductListInteractorInterface: AnyObject {
    func request(page: Int, categoryId: Int, completion: @escaping (Result<ProductListUIModel, Error>) -> Void)
}

protocol ProductListWireframeProtocol: AnyObject {
}
