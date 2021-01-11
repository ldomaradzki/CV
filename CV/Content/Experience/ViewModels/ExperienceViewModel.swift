//
//  ExperienceViewModel.swift
//  CV
//
//  Created by Lukasz Domaradzki on 09/01/2021.
//

import Foundation
import UIKit

class ExperienceViewModel: NSObject {
    private var dataProvider: DataProvider
    private var works: [Work]
    
    init(dataProvider: DataProvider) {
        self.dataProvider = dataProvider
        self.works = dataProvider.fetchAllWorks()
    }
    
    let yearsOfExperienceTitle = "Years of experience"
    var yearsOfExperienceValue: String {
        let timeInterval: Double = works.reduce(into: 0.0) { (result, work) in
            result += (work._endDate ?? Date()).timeIntervalSince(work.startDate)
        }
        
        let years = timeInterval / 3600 / 24 / 365
        return String(format: "%.1f", years)
    }
    
    let patentsTitle = "No. of patents"
    let patentsValue = "2"
    
    let skillsTitle = "Skills"
    var skillsValue: String {
        let results = works.reduce(into: []) { (result, work) in
            result.append(contentsOf: work.skills)
        }
        return "\(results.unique.count)+"
    }
    
    let catsTitle = "No. of cats"
    let catsValue = "2"
}

extension ExperienceViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        works.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExperienceWorkTableViewCell.reuseIdentifier(), for: indexPath) as? ExperienceWorkTableViewCell,
              works.indices.contains(indexPath.row) else {
            fatalError()
        }
        
        let viewModel = ExperienceWorkViewModel(work: works[indexPath.row])
        cell.setup(viewModel: viewModel)
        
        return cell
    }
    
    
}
