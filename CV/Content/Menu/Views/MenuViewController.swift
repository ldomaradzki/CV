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
        label.font = .boldSystemFont(ofSize: 26)
        return label
    }()
    
    @UsesAutoLayout
    private var headerIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "CVLogo"))
        return imageView
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
    private var contactView = MenuContactView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondaryBackground
        
        setupLayout()
    }
    
    func setup(_ viewModel: MenuViewModel) {
        tableView.dataSource = viewModel
        tableView.delegate = viewModel
        contactView.setButtonAction(viewModel.contactAction)
        
        // manually select first row
        tableView.selectRow(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .none)
        viewModel.delegate?.didSelect(menu: .about)
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
            equal(\.centerXAnchor, constant: 20)
        ])
        
        header.addSubview(headerIcon, constraints: [
            equal(\.centerYAnchor),
            equal(\.leftAnchor, constant: 35),
            constant(\.widthAnchor, constant: 46),
            constant(\.heightAnchor, constant: 39)
        ])
        
        // MENU
        view.addSubview(tableView, constraints: [
            equal(\.leftAnchor),
            equal(\.rightAnchor),
            equal(\.topAnchor, constant: headerHeight),
            constant(\.heightAnchor, constant: 400)
        ])
        
        // CONTACT
        view.addSubview(contactView, constraints: [
            equal(\.leftAnchor, constant: contactsMargin),
            equal(\.rightAnchor, constant: -contactsMargin),
            equal(\.bottomAnchor, constant: -contactsMargin),
            constant(\.heightAnchor, constant: 200)
        ])
    }
}
