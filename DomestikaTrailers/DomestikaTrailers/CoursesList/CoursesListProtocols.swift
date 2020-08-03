//
//  CoursesListProtocols.swift
//  DomestikaTrailers
//
//  Created by Albert Arredondo Alfaro on 30/07/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import Foundation

// View / Presenter
protocol CoursesListViewInjection : AnyObject {
    func showLoader(_ show: Bool)
    func loadTopCarouselView(_ courses: [CoursesListViewModel])
    func loadBottomCarouselView(_ courses: [CoursesListViewModel])
}

protocol CoursesListPresenterDelegate : AnyObject {
    func viewDidLoad()
}

// Presenter / Interactor
typealias CoursesListGetAssetsCompletionBlock = (_ viewModel: [CoursesListViewModel]?, _ error: Error?) -> Void

protocol CoursesListInteractorDelegate : AnyObject {
    func getAssets(completion: @escaping CoursesListGetAssetsCompletionBlock)
}

// Presenter / Router
protocol CoursesListRouterDelegate : AnyObject {
    //__ Define your router protocols here
}
