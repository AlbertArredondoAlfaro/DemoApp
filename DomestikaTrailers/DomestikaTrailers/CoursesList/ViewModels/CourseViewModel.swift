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
    let teacherAvatarUrl: String?
    let courseDescription: String?
    let location: String?
    let positiveReviews: Int?
    let totalReviews: Int?
    let lessons: Int?
    let students: Int?
    let audio: String?
    let subtitles: [String]?
    let level: String?
    let trailerUrl: String?
}

extension CourseViewModel {

    public static func getViewModelsWith(_ assets: [DomestikaAsset]) -> [CourseViewModel] {
        return assets.map { getViewModelWith($0) }
    }

    static func getViewModelWith(_ asset: DomestikaAsset) -> CourseViewModel {
        return CourseViewModel(title: asset.title,
                               thumbnailUrl: asset.thumbnailUrl,
                               teacherName: asset.teacher?.name,
                               teacherAvatarUrl: asset.teacher?.avatarUrl,
                               courseDescription: asset.description,
                               location: asset.location,
                               positiveReviews: asset.reviews?.positive,
                               totalReviews: asset.reviews?.total,
                               lessons: asset.lessonsCount,
                               students: asset.students,
                               audio: asset.audio,
                               subtitles: asset.subtitles,
                               level: asset.level,
                               trailerUrl: asset.trailerUrl)
    }
}

