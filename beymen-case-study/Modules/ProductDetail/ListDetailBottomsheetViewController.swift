//
//  ListDetailBottomsheetViewController.swift
//  beymen-case-study
//
//  Created by Ayşe Nur Nimetoğlu on 18.01.2025.
//

import Foundation
import UIKit

class ListDetailBottomsheetViewController: UIViewController, UITextFieldDelegate {
        
    private var selectedTripCount: Int = 10
    
    var sliderAverageTripEarning = 10
    var memberEarningPerDay: Double = 0.0
    var sliderDefaultTrip: Int = 0
    
    private lazy var bottomsheetUIView: UIView = {
        let bv = UIView()
        bv.translatesAutoresizingMaskIntoConstraints = false
        bv.backgroundColor = .gray
        bv.layer.cornerRadius = 16
        return bv
    }()
    
    lazy var verticalStackview: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()
    
    private lazy var ImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .center
        iv.clipsToBounds = true
        return iv
    }()
    
    private lazy var indicatorView: UIView = {
        let iv = UIView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .black
        return iv
    }()
    
    private lazy var labelview: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textAlignment = .center
        temp.numberOfLines = 3
        return temp
    }()
    
    private lazy var labelview2: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textAlignment = .left
        temp.numberOfLines = 5
        return temp
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func updateLabels(name: String, explanation: String?, imageUrl: String?) {
        labelview.text = name
        labelview2.text = explanation ?? "No Description Available"
        
        if let urlString = imageUrl, let url = URL(string: urlString) {
            loadImage(from: url)
        } else {
            ImageView.image = UIImage(named: "placeholder")
        }
        
        view.setNeedsLayout()
        view.layoutIfNeeded()
    }

    
    private func loadImage(from url: URL) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.ImageView.image = image
                }
            }
        }
    }
    
    // MARK: - setupUI
    private func setupUI() {
        view.addSubview(bottomsheetUIView)
        bottomsheetUIView.addSubview(indicatorView)
        bottomsheetUIView.addSubview(verticalStackview)
        
        verticalStackview.addArrangedSubview(labelview)
        verticalStackview.addArrangedSubview(labelview2)
        verticalStackview.addArrangedSubview(ImageView)
        
        NSLayoutConstraint.activate([
            bottomsheetUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomsheetUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomsheetUIView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    
        NSLayoutConstraint.activate([
            verticalStackview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            verticalStackview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            verticalStackview.topAnchor.constraint(equalTo: bottomsheetUIView.topAnchor, constant: 16),
            verticalStackview.bottomAnchor.constraint(equalTo: bottomsheetUIView.bottomAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            indicatorView.heightAnchor.constraint(equalToConstant: 4),
            indicatorView.widthAnchor.constraint(equalToConstant: 40),
            indicatorView.bottomAnchor.constraint(equalTo: verticalStackview.topAnchor, constant: -10),
            indicatorView.centerXAnchor.constraint(equalTo: verticalStackview.centerXAnchor)
        ])
    }
}

