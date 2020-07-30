//
//  NetworkManager.swift
//  DomestikaTrailers
//
//  Created by Albert Arredondo Alfaro on 30/07/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import Foundation

enum NetworkResult<T> {
    case success([T])
    case failure(Error?)
}

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

final class NetworkManager {
    
    static let shared: NetworkManager = { return NetworkManager() }()
    
    func loadAssets<T: Decodable>(from url: URL, completionHandler: @escaping (NetworkResult<T>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let dataObject = data else {
                completionHandler(.failure(error))
                return
            }
            
            let asset = try! JSONDecoder().decode([T].self, from: dataObject)
            completionHandler(.success(asset))
        }
        task.resume()
    }
}

/*
 
 "id": "387",
 "thumbnailUrl": "http://mobile-assets.domestika.org/challenge/387-original.jpg",
 "title": "Introduction to Adobe Photoshop",
 "trailerUrl": "https://player.vimeo.com/external/295400375.hd.mp4?s=feac97d87265e818dfca5387a9b18d3ad7fff989&profile_id=175&oauth2_token_id=1121588336",
 "description": "Learn Adobe Photoshop from scratch and master the best software for treatment, retouching and creation of digital images on the market",
 "location": "Barcelona, Spain",
 "teacher": {
   "name": "Carles Marsal",
   "avatarUrl": "http://mobile-assets.domestika.org/challenge/89569-original.jpg"
 },
 "reviews": {
   "positive": 4008,
   "total": 4100
 },
 "lessonsCount": 50,
 "students": 161905,
 "audio": "Spanish",
 "subtitles": [
   "English",
   "Spanish",
   "Portuguese"
 ],
 "level": "Beginner"
 
 */
