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
    private let interactor: CoursesListInteractorDelegate
    private let router: CoursesListRouterDelegate
    
    // MARK: Lifecycle
    init(view: CoursesListViewInjection, navigationController: UINavigationController? = nil) {
        self.view = view
        self.interactor = CoursesListInteractor()
        self.router = CoursesListRouter(navigationController: navigationController)
    }
    
}

// MARK: - CoursesListPresenterDelegate
extension CoursesListPresenter: CoursesListPresenterDelegate {
    func viewDidLoad() {
        getAssets(showLoader: true)
    }
}

// MARK: - Private Section
extension CoursesListPresenter {
    private func getAssets(showLoader: Bool) {
        
        view?.showLoader(showLoader)
        
        interactor.getAssets { [weak self] (courses, error) in
            self?.view?.showLoader(false)
            guard let courses = courses else {
                // TODO: we can show some error to the user here
                return
            }
            let firstFourItemsArray = Array(courses.prefix(4))
            self?.view?.loadTopCarouselView(firstFourItemsArray)
        }
    }
}
