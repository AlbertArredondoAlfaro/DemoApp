//
//  DomestikaAsset.swift
//  DomestikaTrailers
//
//  Created by Albert Arredondo Alfaro on 31/07/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import Foundation

struct DomestikaAsset: Decodable {
    struct Teacher: Codable {
        let name: String?
        let avatarUrl: String?
    }

    struct Review: Codable {
        let positive: Int?
        let total: Int?
    }
    
    let id: String?
    let thumbnailUrl: String?
    let title: String?
    let trailerUrl: String?
    let description: String?
    let location: String?
    let teacher: Teacher?
    let reviews: Review?
    let lessonsCount: Int?
    let students: Int?
    let audio: String?
    let subtitles: [String]?
    let level: String?
}
