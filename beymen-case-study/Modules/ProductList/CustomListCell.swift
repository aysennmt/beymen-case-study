//
//  CustomListCell.swift
//  beymen-case-study
//
//  Created by Ayşe Nur Nimetoğlu on 18.01.2025.
//

import Foundation
import UIKit

class CustomListCell: UITableViewCell {
    
    static let identifier = "CustomListCell"
    
    let imageViewCell: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(imageViewCell)
        contentView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            imageViewCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            imageViewCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            imageViewCell.widthAnchor.constraint(equalToConstant: 80),
            imageViewCell.heightAnchor.constraint(equalToConstant: 80),
            
            nameLabel.leadingAnchor.constraint(equalTo: imageViewCell.trailingAnchor, constant: 16),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    func configure(with product: ProductListUIModel) {
        if let firstProduct = product.products.first {
            nameLabel.text = firstProduct.displayName
            if let url = URL(string: firstProduct.imageUrl) {
                imageViewCell.loadImage(from: url)
            }
        }
    }
}

extension UIImageView {
    func loadImage(from url: URL) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            }
        }
    }
}
