//
//  ProductDetailViewController.swift
//  beymen-case-study
//
//  Created by Ayşe Nur Nimetoğlu on 18.01.2025.
//

import Foundation
import UIKit

class ProductDetailViewController: UIViewController, ProductDetailView {
    
    var presenter: ProductDetailPresenterProtocol?
    
    private let favoriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add to Favorites", for: .normal)
        button.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func favoriteButtonTapped() {
    }
    
}
