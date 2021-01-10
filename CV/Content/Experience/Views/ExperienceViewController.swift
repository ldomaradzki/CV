//
//  ExperienceViewController.swift
//  CV
//
//  Created by Lukasz Domaradzki on 09/01/2021.
//

import Foundation
import UIKit

class ExperienceViewController: UIViewController {
    private let margin: CGFloat = 30
    
    private var tableContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .secondaryBackground
        view.layer.cornerRadius = 30
        return view
    }()
    
    private var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .clear
        tableView.register(ExperienceWorkTableViewCell.self)
        return tableView
    }()
    
    private var yearsOfExpTile = TileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
    
    private func setupLayout() {
        view.addSubview(tableContainer, constraints: [
            equal(\.topAnchor, constant: margin),
            equal(\.leftAnchor, constant: margin),
            equal(\.bottomAnchor, constant: -margin),
            equal(\.rightAnchor, constant: -margin - 200)
        ])
        
        tableContainer.addSubview(tableView, constraints: [
            equal(\.topAnchor, constant: 10),
            equal(\.leftAnchor),
            equal(\.bottomAnchor, constant: -10),
            equal(\.rightAnchor)
        ])
        
        view.addSubview(yearsOfExpTile, constraints: [
            equal(\.rightAnchor, constant: -margin),
            equal(\.topAnchor, constant: margin),
            constant(\.widthAnchor, constant: 170),
            constant(\.heightAnchor, constant: 140)
        ])
    }
    
    func setup(_ viewModel: ExperienceViewModel) {
        tableView.dataSource = viewModel
        yearsOfExpTile.setup(value: viewModel.yearsOfExperienceValue, title: viewModel.yearsOfExperienceTitle, color: .yellowish)
    }
}
