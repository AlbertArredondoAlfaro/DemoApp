//
//  CoursesListRouter.swift
//  DomestikaTrailers
//
//  Created by Albert Arredondo Alfaro on 30/07/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import UIKit

class CoursesListRouter {
    
    private weak var view: CoursesListViewInjection?
    private weak var navigationController: UINavigationController?
    
    init(view: CoursesListViewInjection? = nil, navigationController: UINavigationController? = nil) {
        self.view = view
        self.navigationController = navigationController
    }
    
    /**
     Setup the initial module
     */
    public static func setupModule(navigationController: UINavigationController? = nil) -> UIViewController {
        let vc = CoursesListViewController()
        let presenter = CoursesListPresenter(view: vc, navigationController: navigationController)
        vc.presenter = presenter
        return vc
    }
    
}

// MARK: - CoursesListRouterDelegate
extension CoursesListRouter: CoursesListRouterDelegate {
    func showCourseDetailWithViewModel(_ viewModel: CourseViewModel) {
        let vc = CoursesDetailRouter.setupModule(withModel: viewModel, navigationController: navigationController)
        navigationController?.pushViewController(vc, animated: true)
    }
}
