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
    //__ Implement your protocols here
}
