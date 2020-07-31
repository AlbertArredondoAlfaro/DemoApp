//
//  CourseListWorker.swift
//  DomestikaTrailers
//
//  Created by Albert Arredondo Alfaro on 31/07/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import Foundation

class DocumentListWorker {
    //__ Network API client
    private let client: NetworkManager?

    init(_ client: NetworkManager? = nil) {
        self.client = client
    }

    public func fetchAssets(_ successCallback: SuccessHandler<[DomestikaAsset]>, _ errorCallback: FailureHandler) {
        guard let url = URL(string: "http://mobile-assets.domestika.org/challenge/home.json") else { return }
        
        client?.loadData(from: url) { (response: NetworkResult<DomestikaAsset>) in
            switch response {
            case .success(let assets):
                successCallback?(assets)
            case .failure(let error):
                errorCallback?(error)
            }
        }
    }
}
