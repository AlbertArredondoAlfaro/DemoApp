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

/**
* NetworkManager
* Class reponsable to make API requests
*/
final class NetworkManager {
    
    let urlSession: URLSession
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func loadData<T: Decodable>(from url: URL, completionHandler: @escaping (NetworkResult<T>) -> Void) {
        let task = urlSession.dataTask(with: url) { data, _, error in
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
