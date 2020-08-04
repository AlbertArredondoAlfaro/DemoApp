//
//  CoursesDetailProtocols.swift
//  DomestikaTrailers
//
//  Created by Albert Arredondo Alfaro on 03/08/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import Foundation

// View / Presenter
protocol CoursesDetailViewInjection : AnyObject {
    func loadDataWithViewModel(with model: CourseViewModel)
}

protocol CoursesDetailPresenterDelegate : AnyObject {
    func viewDidLoad()
}

// Presenter / Interactor
protocol CoursesDetailInteractorDelegate : AnyObject {
    //__ Define your interactor protocols here
}

// Presenter / Router
protocol CoursesDetailRouterDelegate : AnyObject {
    //__ Define your router protocols here
}
