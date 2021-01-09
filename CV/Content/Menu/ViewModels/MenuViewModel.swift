//
//  MenuViewModel.swift
//  CV
//
//  Created by Lukasz Domaradzki on 08/01/2021.
//

import Foundation
import UIKit

class MenuViewModel: NSObject {
    weak var delegate: MenuDelegate?
}

extension MenuViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        MenuRow.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuItemTableViewCell.reuseIdentifier(), for: indexPath) as? MenuItemTableViewCell else {
            fatalError()
        }
        
        cell.setup(viewModel: MenuItemViewModel(indexPath.row))
        
        return cell
    }
}

extension MenuViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menu = MenuRow(rawValue: indexPath.row) else { return }
        delegate?.didSelect(menu: menu)
    }
}
