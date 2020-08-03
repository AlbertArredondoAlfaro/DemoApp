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
        cell.bindWithViewModel(viewModel)
        
        return cell
    }
    
    private func generateCourseDescriptionCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CourseDescriptionCell.identifier, for: indexPath) as? CourseDescriptionCell else { return UITableViewCell() }
        
        //__ Bind the cell
        guard let viewModel = viewModel else { return UITableViewCell() }
        cell.bindWithViewModel(viewModel)
        
        return cell
    }
    
    private func generateDetailsCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, rowType: CourseDetailRows) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CourseDetailsCell.identifier, for: indexPath) as? CourseDetailsCell else { return UITableViewCell() }
        
        //__ Bind the cell
        guard let viewModel = viewModel else { return UITableViewCell() }
        
        var detailText = ""
        var detailImage = ""
        
        switch rowType {
        case .reviews:
            guard let positiveReviews = viewModel.positiveReviews else { return UITableViewCell() }
            detailText = String(format: "%@%% Positive reviews (%d)", viewModel.positiveReviewsPercentage, positiveReviews)
            detailImage = "reviews"
        case .lessons:
            guard let lessons = viewModel.lessons else { return UITableViewCell() }
            detailText = String(format: "%d Lessons", lessons)
            detailImage = "lessons"
        case .students:
            guard let students = viewModel.students else { return UITableViewCell() }
            detailText = String(format: "%d Students", students)
            detailImage = "students"
        case .audio:
            guard let audio = viewModel.audio else { return UITableViewCell() }
            detailText = String(format: "Audio: %@", audio)
            detailImage = "audio"
        case .subtitles:
            detailText = viewModel.joinedSubtitles
            detailImage = "subtitles"
        default:
            print("Do nothing")
        }
        
        cell.bindWithDetail(detailText, detailImage: detailImage)
        
        return cell
    }
    
    private func generateLevelCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CourseLevelCell.identifier, for: indexPath) as? CourseLevelCell else { return UITableViewCell() }
    
        //__ Bind the cell
        guard let viewModel = viewModel else { return UITableViewCell() }
        
        guard let level = viewModel.level else { return UITableViewCell() }
        cell.bindWithDetail(level, detailImage: "level", levelColor: viewModel.levelColor)
        return cell
    }
    
}

// MARK: - UITableViewDataSource
extension CoursesDetailDatasource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CourseDetailRows.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = CourseDetailRows.allCases[indexPath.row]
        
        switch row {
        case .trailer:
            return generateTrailerCell(tableView, cellForRowAt: indexPath)
        case .description:
            return generateCourseDescriptionCell(tableView, cellForRowAt: indexPath)
        case .reviews, .lessons, .students, .audio, .subtitles:
            return generateDetailsCell(tableView, cellForRowAt: indexPath, rowType: row)
        case .level:
            return generateLevelCell(tableView, cellForRowAt: indexPath)
        }
    }
}
