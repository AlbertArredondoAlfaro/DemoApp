//
//  CoursesListInteractor.swift
//  DomestikaTrailers
//
//  Created by Albert Arredondo Alfaro on 30/07/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import Foundation

class CoursesListInteractor {
    var coursesListWorker = CoursesListWorker()
    var assets: [DomestikaAsset]?
}

// MARK: - CoursesListInteractorDelegate
extension CoursesListInteractor: CoursesListInteractorDelegate {
    /**
     * Get assets with completion
     - parameter completion: CoursesListGetAssetsCompletionBlock completion block
     */
    func getAssets(completion: @escaping CoursesListGetAssetsCompletionBlock) {
        
        coursesListWorker.fetchAssets({ [weak self] assets in
            completion(self?.generateViewModelsWith(assets: assets), nil)
        }, { error in
            completion(nil, error)
        })
    }
}

// MARK: - Private section
extension CoursesListInteractor {
    
    /**
     Process assets
     - parameter assets: DomestikaAsset  array to evaluate
     - returns: an optional CourseListViewModel array
     */
    private func generateViewModelsWith(assets: [DomestikaAsset]) -> [CourseViewModel]? {
        //__ Get the view models
        let viewModels = CourseViewModel.getViewModelsWith(assets)
        return viewModels
    }
}
