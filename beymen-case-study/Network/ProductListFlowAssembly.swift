//
//  ProductListFlowAssembly.swift
//  beymen-case-study
//
//  Created by Ayşe Nur Nimetoğlu on 18.01.2025.
//

import Foundation

class ProductListFlowAssembly {
    static func assemble() -> ProductListViewController {
        let view = ProductListViewController()
        let interactor = ProductListInteractor(networkManager: NetworkManager.shared)
        let wireframe = ProductListWireframe()
        let presenter = ProductListPresenter(view: view, interactor: interactor, wireframe: wireframe)
        
        view.presenter = presenter
        
        return view
    }
}

