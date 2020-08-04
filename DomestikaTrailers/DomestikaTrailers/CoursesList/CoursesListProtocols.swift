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
    func loadTopCarouselView(_ courses: [CourseViewModel])
    func loadBottomCarouselView(_ courses: [CourseViewModel])
}

protocol CoursesListPresenterDelegate : AnyObject {
    func viewDidLoad()
    func watchTopCarouselCourse(at index: Int)
    func watchBottomCarouselCourse(at index: Int)
}

// Presenter / Interactor
typealias CoursesListGetAssetsCompletionBlock = (_ viewModel: [CourseViewModel]?, _ error: Error?) -> Void

protocol CoursesListInteractorDelegate : AnyObject {
    func getAssets(completion: @escaping CoursesListGetAssetsCompletionBlock)
}

// Presenter / Router
protocol CoursesListRouterDelegate : AnyObject {
    func showCourseDetailWithViewModel(_ viewModel: CourseViewModel)
}
