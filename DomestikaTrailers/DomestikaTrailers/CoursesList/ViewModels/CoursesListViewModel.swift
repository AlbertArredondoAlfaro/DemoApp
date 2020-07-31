//
//  CourseListViewModel.swift
//  DomestikaTrailers
//
//  Created by Albert Arredondo Alfaro on 31/07/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import Foundation

struct CoursesListViewModel {
    let title: String?
    let thumbnailUrl: String?
    let teacherName: String?
}

extension CoursesListViewModel {

    public static func getViewModelsWith(_ assets: [DomestikaAsset]) -> [CoursesListViewModel] {
        return assets.map { getViewModelWith($0) }
    }

    static func getViewModelWith(_ asset: DomestikaAsset) -> CoursesListViewModel {
        return CoursesListViewModel(title: asset.title, thumbnailUrl: asset.thumbnailUrl, teacherName: asset.teacher?.name)
    }
}

