//
//  ExperienceWorkTableViewCell.swift
//  CV
//
//  Created by Lukasz Domaradzki on 10/01/2021.
//

import Foundation
import UIKit

class ExperienceWorkTableViewCell: UITableViewCell {
    private var companyNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .primaryColor
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 0
        return label
    }()
    
    private var positionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blackish
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blackish
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private var datesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blackish
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        var background: UIBackgroundConfiguration = .listPlainCell()
        background.cornerRadius = 15
        background.backgroundColor = .white
        background.backgroundInsets = .init(top: 5, leading: 20, bottom: 5, trailing: 20)
        backgroundConfiguration = background
        
        contentView.addSubview(companyNameLabel, constraints: [
            equal(\.topAnchor, constant: 20),
            equal(\.leftAnchor, constant: 40)
        ])
        
        contentView.addSubview(positionLabel, constraints: [
            equal(\.topAnchor, otherView: companyNameLabel, \.bottomAnchor, constant: 5),
            equal(\.leftAnchor, constant: 40),
        ])
        
        contentView.addSubview(descriptionLabel, constraints: [
            equal(\.topAnchor, otherView: positionLabel, \.bottomAnchor, constant: 10),
            equal(\.leftAnchor, constant: 40),
            equal(\.bottomAnchor, constant: -20),
            equal(\.rightAnchor, constant: -40)
        ])
        
        contentView.addSubview(datesLabel, constraints: [
            equal(\.rightAnchor, constant: -40),
            equal(\.topAnchor, constant: 20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(viewModel: ExperienceWorkViewModel) {
        companyNameLabel.text = viewModel.work.companyName
        positionLabel.text = viewModel.work.lastPosition
        descriptionLabel.text = viewModel.work.positionDescription
        datesLabel.text = viewModel.dates
    }
}
