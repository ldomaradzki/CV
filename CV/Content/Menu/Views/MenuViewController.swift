//
//  MenuViewController.swift
//  CV
//
//  Created by Lukasz Domaradzki on 08/01/2021.
//

import Foundation
import UIKit

class MenuViewController: UIViewController {
    @UsesAutoLayout
    private var header = UIView()
    
    @UsesAutoLayout
    private var headerTitle: UILabel = {
        let label = UILabel()
        label.text = "Curriculum\nVitae"
        label.numberOfLines = 0
        label.textColor = .primaryColor
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()
    
    @UsesAutoLayout
    private var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        tableView.rowHeight = 80.0
        tableView.backgroundColor = .clear
        tableView.register(MenuItemTableViewCell.self, forCellReuseIdentifier: MenuItemTableViewCell.reuseIdentifier())
        return tableView
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(rgb: 0xFAFAFA)
        
        setupLayout()
    }
    
    func setup(_ viewModel: MenuViewModel) {
        tableView.dataSource = viewModel
        tableView.selectRow(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .none)
    }
    
    private func setupLayout() {
        let headerHeight: CGFloat = 150
        // HEADER
        view.addSubview(header, constraints: [
            equal(\.topAnchor),
            equal(\.leftAnchor),
            equal(\.rightAnchor),
            constant(\.heightAnchor, constant: headerHeight)
        ])
        
        header.addSubview(headerTitle, constraints: [
            equal(\.centerYAnchor),
            equal(\.centerXAnchor)
        ])
        
        // MENU
        view.addSubview(tableView, constraints: [
            equal(\.leftAnchor),
            equal(\.rightAnchor),
            equal(\.topAnchor, constant: headerHeight),
            constant(\.heightAnchor, constant: 400)
        ])
    }
}
