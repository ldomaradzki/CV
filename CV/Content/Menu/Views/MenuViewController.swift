//
//  MenuViewController.swift
//  CV
//
//  Created by Lukasz Domaradzki on 08/01/2021.
//

import Foundation
import UIKit

class MenuViewController: UIViewController {
    private let contactsMargin: CGFloat = 40
    
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
        tableView.rowHeight = 60.0
        tableView.backgroundColor = .clear
        tableView.isScrollEnabled = false
        tableView.register(MenuItemTableViewCell.self)
        return tableView
    }()
    
    @UsesAutoLayout
    private var contactContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .brightOrange
        view.layer.cornerRadius = 30
        return view
    }()
    
    @UsesAutoLayout
    private var contactButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = .white
        button.setTitle("Mail me!", for: .normal)
        button.tintColor = .blackish
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 15
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
        button.layer.shadowRadius = 0
        button.layer.shadowOpacity = 0.5
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondaryBackground
        
        setupLayout()
    }
    
    func setup(_ viewModel: MenuViewModel) {
        tableView.dataSource = viewModel
        tableView.delegate = viewModel
        
        // manually select first row
        tableView.selectRow(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .none)
        viewModel.delegate?.didSelect(menu: .about)
        
        contactButton.addAction(viewModel.contactAction, for: .touchUpInside)
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
        
        // CONTACT
        view.addSubview(contactContainerView, constraints: [
            equal(\.leftAnchor, constant: contactsMargin),
            equal(\.rightAnchor, constant: -contactsMargin),
            equal(\.bottomAnchor, constant: -contactsMargin),
            constant(\.heightAnchor, constant: 250)
        ])
        
        contactContainerView.addSubview(contactButton, constraints: [
            equal(\.centerXAnchor),
            equal(\.bottomAnchor, constant: -30.0),
            constant(\.widthAnchor, constant: 110),
            constant(\.heightAnchor, constant: 40)
        ])
    }
}
