//
//  NetworkManager.swift
//  DomestikaTrailers
//
//  Created by Albert Arredondo Alfaro on 30/07/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import Foundation

typealias SuccessHandler<T> = ((T) -> Void)?
typealias FailureHandler = ((Error?) -> Void)?

enum NetworkResult<T> {
    case success([T])
    case failure(Error?)
}

/**
* NetworkManager
* Class reponsable to make API requests
*/
final class NetworkManager {
    
    let urlSession: URLSession
    init (urlSession: URLSession = .shared) {
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
