//
//  CoursesListPresenter.swift
//  DomestikaTrailers
//
//  Created by Albert Arredondo Alfaro on 30/07/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import UIKit

class CoursesListPresenter {
    
    private weak var view: CoursesListViewInjection?
    var interactor: CoursesListInteractorDelegate
    private let router: CoursesListRouterDelegate
    
    private var topCarouselAssets: [CourseViewModel] = []
    private var bottomCarouselAssets: [CourseViewModel] = []
    
    // MARK: Lifecycle
    init(view: CoursesListViewInjection, navigationController: UINavigationController? = nil) {
        self.view = view
        self.interactor = CoursesListInteractor()
        self.router = CoursesListRouter(navigationController: navigationController)
    }
    
}

// MARK: - CoursesListPresenterDelegate
extension CoursesListPresenter: CoursesListPresenterDelegate {
    func watchBottomCarouselCourse(at index: Int) {
        let viewModel = bottomCarouselAssets[index]
        router.showCourseDetailWithViewModel(viewModel)
    }
    
    func watchTopCarouselCourse(at index: Int) {
        let viewModel = topCarouselAssets[index]
        router.showCourseDetailWithViewModel(viewModel)
    }
    
    func viewDidLoad() {
        getAssets(showLoader: true)
    }
}

// MARK: - Private Section
extension CoursesListPresenter {
    private func getAssets(showLoader: Bool) {
        
        view?.showLoader(showLoader)
        
        interactor.getAssets { [weak self] (courses, error) in
            guard let `self` = self else { return }
            
            self.view?.showLoader(false)
            guard let courses = courses else {
                // TODO: we can show some error to the user here
                return
            }
            
            // Load top carousel
            self.topCarouselAssets = Array(courses.prefix(4))
            self.view?.loadTopCarouselView(self.topCarouselAssets)
            
            // Load bottom carousel
            self.bottomCarouselAssets = Array(courses.dropFirst(4))
            self.view?.loadBottomCarouselView(self.bottomCarouselAssets)
        }
    }
}
