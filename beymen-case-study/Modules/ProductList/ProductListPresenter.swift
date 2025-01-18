//
//  ProductListPresenter.swift
//  beymen-case-study
//
//  Created by Ayşe Nur Nimetoğlu on 18.01.2025.
//

import Foundation

// MARK: - Presenter
class ProductListPresenter: ProductListPresenterProtocol {
    
    weak var view: ProductListView?
    var interactor: ProductListInteractorInterface?
    var wireframe: ProductListWireframeProtocol?

    init(view: ProductListView, interactor: ProductListInteractorInterface, wireframe: ProductListWireframeProtocol) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    func viewDidLoad() {
        loadMoreProduct(page: 1)
        print("---- presenter viewDidLoad called")

    }

    func getProductDetail(page: Int, categoryId: Int) {
        interactor?.request(page: page, categoryId: categoryId) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                self.present(model: model)
            case .failure(let error):
                self.view?.showError(error: error.localizedDescription)
            }
        }
    }

    func present(model: ProductListUIModel) {
        view?.populate(viewModel: model)
    }
    
    func loadMoreProduct(page: Int) {
        print("---- Loading products for page: \(page)")
        interactor?.request(page: page, categoryId: 10020) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let products):
                print("---- Loaded \(products.products.count) products")
                self.view?.appendProducts(product: products.products)
            case .failure(let error):
                print("---- Failed to load products: \(error.localizedDescription)")
                self.view?.showError(error: error.localizedDescription)
            }
        }
    }

}
