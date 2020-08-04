//
//  CoursesDetailPresenter.swift
//  DomestikaTrailers
//
//  Created by Albert Arredondo Alfaro on 03/08/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import UIKit

class CoursesDetailPresenter {
    
    private weak var view: CoursesDetailViewInjection?
    private let interactor: CoursesDetailInteractorDelegate
    private let router: CoursesDetailRouterDelegate
    
    private var viewModel: CourseViewModel
    
    // MARK: Lifecycle
    init(view: CoursesDetailViewInjection, model: CourseViewModel, navigationController: UINavigationController? = nil) {
        self.view = view
        self.interactor = CoursesDetailInteractor()
        self.router = CoursesDetailRouter(navigationController: navigationController)
        self.viewModel = model
    }
    
}

// MARK: - CoursesDetailPresenterDelegate
extension CoursesDetailPresenter: CoursesDetailPresenterDelegate {
    func viewDidLoad() {
        view?.loadDataWithViewModel(with: viewModel)
    }
}
