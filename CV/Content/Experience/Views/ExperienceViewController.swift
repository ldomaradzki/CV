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
    private var noOfPatentsTile = TileView()
    private var skillsTile = TileView()
    private var noOfCatsTile = TileView()
    
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
        
        let width: CGFloat = 170
        let height: CGFloat = 140
        
        view.addSubview(yearsOfExpTile, constraints: [
            equal(\.rightAnchor, constant: -margin),
            equal(\.topAnchor, constant: margin),
            constant(\.widthAnchor, constant: width),
            constant(\.heightAnchor, constant: height)
        ])
        
        view.addSubview(noOfPatentsTile, constraints: [
            equal(\.rightAnchor, constant: -margin),
            equal(\.topAnchor, otherView: yearsOfExpTile, \.bottomAnchor, constant: 10),
            constant(\.widthAnchor, constant: width),
            constant(\.heightAnchor, constant: height)
        ])
        
        view.addSubview(skillsTile, constraints: [
            equal(\.rightAnchor, constant: -margin),
            equal(\.topAnchor, otherView: noOfPatentsTile, \.bottomAnchor, constant: 10),
            constant(\.widthAnchor, constant: width),
            constant(\.heightAnchor, constant: height)
        ])
        
        view.addSubview(noOfCatsTile, constraints: [
            equal(\.rightAnchor, constant: -margin),
            equal(\.topAnchor, otherView: skillsTile, \.bottomAnchor, constant: 10),
            constant(\.widthAnchor, constant: width),
            constant(\.heightAnchor, constant: height)
        ])
    }
    
    func setup(_ viewModel: ExperienceViewModel) {
        tableView.dataSource = viewModel
        yearsOfExpTile.setup(value: viewModel.yearsOfExperienceValue, title: viewModel.yearsOfExperienceTitle, color: .yellowish)
        noOfPatentsTile.setup(value: viewModel.patentsValue, title: viewModel.patentsTitle, color: .greenish)
        skillsTile.setup(value: viewModel.skillsValue, title: viewModel.skillsTitle, color: .yellowish)
        noOfCatsTile.setup(value: viewModel.catsValue, title: viewModel.catsTitle, color: .brightOrange)
    }
}
