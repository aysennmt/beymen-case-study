//
//  ProductListViewController.swift
//  beymen-case-study
//
//  Created by Ayşe Nur Nimetoğlu on 18.01.2025.
//

import Foundation
import UIKit

class ProductListViewController: UIViewController, ProductListView {

    var presenter: ProductListPresenterProtocol?
    var productList: [ProductListUIModel] = []
    private var currentPage = 1
    private var isLoading = false
    private var isGridView = false

    private let stepTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CustomListCell.self, forCellReuseIdentifier: CustomListCell.identifier)
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = true
        tableView.layer.cornerRadius = 16
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupUI()
        themeUI()
        stepTableView.delegate = self
        stepTableView.dataSource = self
        print("---- controller viewDidLoad called")
    }
    
    func themeUI() {
        view.backgroundColor = .white
    }

    func setupUI() {
        view.addSubview(stepTableView)

        NSLayoutConstraint.activate([
            stepTableView.topAnchor.constraint(equalTo: view.topAnchor),
            stepTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stepTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stepTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    func updateProductData(product: [ProductUIModel]) {
        let uiModels = product.map { ProductListUIModel(products: [$0]) } // Tek bir item için dizi oluşturuyoruz
        self.productList = uiModels
        DispatchQueue.main.async {
            self.stepTableView.reloadData()
        }
    }

    func appendProducts(product: [ProductUIModel]) {
        let uiModels = product.map { ProductListUIModel(products: [$0]) }
        self.productList.append(contentsOf: uiModels)
        DispatchQueue.main.async {
            self.stepTableView.reloadData()
        }
    }

    func present(model: [ProductUIModel]) {
        let uiModels = model.map { ProductListUIModel(products: [$0]) }
        updateProductData(product: model)
    }

    func showError(error: String) {
        print("Error: \(error)")
    }

    func loadMoreData() {
        guard !isLoading else { return }
        isLoading = true
        currentPage += 1
        presenter?.loadMoreProduct(page: currentPage)
    }

    func toggleViewMode() {
        isGridView.toggle()
        stepTableView.reloadData()
    }

    func populate(viewModel: ProductListUIModel) {
        DispatchQueue.main.async {
            self.productList = [viewModel]
            self.stepTableView.reloadData()
        }
    }

}

// MARK: - ProductListController TableView
extension ProductListViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return isGridView ? 150 : 120
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Products"
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomListCell.identifier, for: indexPath) as! CustomListCell
        let product = productList[indexPath.row]
        cell.configure(with: product)
        return cell
    }
}

// MARK: - ProductListController UITableViewDelegate
extension ProductListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedProduct = productList[indexPath.row]
        let bottomSheetVC = ListDetailBottomsheetViewController()
        bottomSheetVC.updateLabels(name: selectedProduct.products.first?.displayName ?? "",
                                   explanation: selectedProduct.products.first?.displayName ?? "",
                                   imageUrl: selectedProduct.products.first?.imageUrl ?? "")
        present(bottomSheetVC, animated: true, completion: nil)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y + scrollView.frame.size.height >= scrollView.contentSize.height - 50 {
            if !isLoading {
                loadMoreData()
            }
        }
    }
}

protocol DragToDismissableScrollingContent {
    var scrollView: UIScrollView? { get }
}
