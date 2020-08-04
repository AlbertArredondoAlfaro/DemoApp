//
//  CoursesDetailRouter.swift
//  DomestikaTrailers
//
//  Created by Albert Arredondo Alfaro on 03/08/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import UIKit

class CoursesDetailRouter {
    
    private weak var view: CoursesDetailViewInjection?
    private weak var navigationController: UINavigationController?
    
    init(view: CoursesDetailViewInjection? = nil, navigationController: UINavigationController? = nil) {
        self.view = view
        self.navigationController = navigationController
    }
    
    /**
     Setup the initial module
     */
    public static func setupModule(withModel model: CourseViewModel, navigationController: UINavigationController? = nil) -> UIViewController {
        let vc = CoursesDetailViewController()
        let presenter = CoursesDetailPresenter(view: vc, model: model)
        vc.presenter = presenter
        return vc
    }
    
}

// MARK: - CoursesDetailRouterDelegate
extension CoursesDetailRouter: CoursesDetailRouterDelegate {
    //__ Implement your protocols here
}
