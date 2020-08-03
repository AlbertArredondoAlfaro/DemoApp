//
//  CourseListViewModel.swift
//  DomestikaTrailers
//
//  Created by Albert Arredondo Alfaro on 31/07/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import UIKit

enum LevelColor {
    case begginer
    case intermediate
    case advanced
    case unknown
}

extension LevelColor {
    var value: UIColor {
        get {
            switch self {
            case .begginer:
                return .beginnerColor
            case .intermediate:
                return .intermediateColor
            case .advanced:
                return .advancedColor
            case .unknown:
                return .clear
            }
        }
    }
}

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
    
    var positiveReviewsPercentage: String {
        get {
            guard let positive = positiveReviews, let total = totalReviews else { return "" }
            let percentage = (positive * 100) / total
            return String(format: "%d", percentage)
        }
    }
    
    var joinedSubtitles: String {
        get {
            guard let subtitles = subtitles else { return "No disponibles" }
            if subtitles.count == 0 {
                return "No disponibles"
            }
            return subtitles.joined(separator: "/ ")
        }
    }
    
    var levelColor: LevelColor {
        get {
            guard let level = level else { return .unknown }
            
            if level == "Beginner" {
                return .begginer
            } else if level == "Intermediate" {
                return .intermediate
            } else if level == "Advanced" {
                return .advanced
            } else {
                return .unknown
            }
        }
    }
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

