//
//  CourseListViewModel.swift
//  DomestikaTrailers
//
//  Created by Albert Arredondo Alfaro on 31/07/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import Foundation

struct CourseViewModel {
    let title: String?
    let thumbnailUrl: String?
    let teacherName: String?
}

extension CourseViewModel {

    public static func getViewModelsWith(_ assets: [DomestikaAsset]) -> [CourseViewModel] {
        return assets.map { getViewModelWith($0) }
    }

    static func getViewModelWith(_ asset: DomestikaAsset) -> CourseViewModel {
        return CourseViewModel(title: asset.title, thumbnailUrl: asset.thumbnailUrl, teacherName: asset.teacher?.name)
    }
}

