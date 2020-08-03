//
//  CourseDetailDatasource.swift
//  DomestikaTrailers
//
//  Created by Albert Arredondo Alfaro on 03/08/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import UIKit

enum CourseDetailRows: CaseIterable {
    case video
    case general
    case reviews
    case lessons
    case students
    case audio
    case subtitles
    case level
}

class CoursesDetailDatasource: NSObject {
    public var viewModel: CourseViewModel?
    
}

extension CoursesDetailDatasource {

    private func generateVideoCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CourseDetailVideoCell.identifier, for: indexPath) as? CourseDetailVideoCell else { return UITableViewCell() }
        
        //__ Bind the cell
        guard let viewModel = viewModel else { return UITableViewCell() }
        cell.bindWithViewModel(viewModel, at: indexPath.row)
        
        return cell
    }
}


// MARK: - UITableViewDataSource
extension CoursesDetailDatasource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        //return CourseDetailRows.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = CourseDetailRows.allCases[indexPath.row]
        
        switch row {
        case .video:
            return generateVideoCell(tableView, cellForRowAt: indexPath)
        default:
            return UITableViewCell()
        }
    }
}
