//
//  CoursesListViewController.swift
//  DomestikaTrailers
//
//  Created by Albert Arredondo Alfaro on 30/07/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import UIKit

//__ This class extends UIViewController. Feel free to modify it if needed
class CoursesListViewController: UIViewController {
    
    var presenter: CoursesListPresenterDelegate?
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
}

// MARK: - Setup views
extension CoursesListViewController {
    
    /**
     Setup views
     */
    private func setupViews() {
        //__ Configure your view here
        //__ Background color, title, safe area
        self.view.backgroundColor = .blue
        
        configureSubviews()
        addSubviews()
    }
    
    /**
     Configure subviews
     */
    private func configureSubviews() {
        //__ Configure all the subviews here
    }
    
}

// MARK: - Layout & constraints
extension CoursesListViewController {
    
    /**
     Add subviews
     */
    private func addSubviews() {
        //__ Add all the subviews here
        
        //__ Configure the constraints
    }

}

// MARK: - CoursesListViewInjection
extension CoursesListViewController: CoursesListViewInjection {
    //__ Implement your protocols here
}
