//
//  CourseDetailDatasource.swift
//  DomestikaTrailers
//
//  Created by Albert Arredondo Alfaro on 03/08/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import UIKit

enum CourseDetailRows: CaseIterable {
    case trailer
    case description
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

    private func generateTrailerCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CourseTrailerCell.identifier, for: indexPath) as? CourseTrailerCell else { return UITableViewCell() }
        
        //__ Bind the cell
        guard let viewModel = viewModel else { return UITableViewCell() }
        cell.bindWithViewModel(viewModel, at: indexPath.row)
        
        return cell
    }
    
    private func generateCourseDescriptionCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CourseDescriptionCell.identifier, for: indexPath) as? CourseDescriptionCell else { return UITableViewCell() }
        
        //__ Bind the cell
        guard let viewModel = viewModel else { return UITableViewCell() }
        cell.bindWithViewModel(viewModel, at: indexPath.row)
        
        return cell
    }
}


// MARK: - UITableViewDataSource
extension CoursesDetailDatasource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
        //return CourseDetailRows.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = CourseDetailRows.allCases[indexPath.row]
        
        switch row {
        case .trailer:
            return generateTrailerCell(tableView, cellForRowAt: indexPath)
        case .description:
            return generateCourseDescriptionCell(tableView, cellForRowAt: indexPath)
        default:
            return UITableViewCell()
        }
    }
}
