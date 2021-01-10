//
//  MenuItemTableViewCell.swift
//  CV
//
//  Created by Lukasz Domaradzki on 08/01/2021.
//

import Foundation
import UIKit

class MenuItemTableViewCell: UITableViewCell {
    private let margin: CGFloat = 30
    private let iconSize: CGFloat = 30
    
    private var itemLabel: UILabel = {
        let label = UILabel()
        label.textColor = .primaryColor
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private var itemIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .primaryColor
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
      
        contentView.addSubview(itemLabel, constraints: [
            equal(\.centerYAnchor),
            equal(\.leftAnchor, constant: margin + 70)
        ])
        
        contentView.addSubview(itemIcon, constraints: [
            equal(\.centerYAnchor),
            equal(\.leftAnchor, constant: margin + 30),
            constant(\.heightAnchor, constant: iconSize),
            constant(\.widthAnchor, constant: iconSize)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(viewModel: MenuItemViewModel) {
        itemLabel.text = viewModel.labelText
        itemIcon.image = viewModel.iconImage
    }
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        var background: UIBackgroundConfiguration = .listPlainCell()
        
        if state.isSelected {
            background.cornerRadius = 30
            background.backgroundColor = .white
            background.backgroundInsets = .init(top: 0, leading: margin, bottom: 0, trailing: margin)
        } else {
            background.backgroundColor = .clear
        }
        
        backgroundConfiguration = background
    }
}
