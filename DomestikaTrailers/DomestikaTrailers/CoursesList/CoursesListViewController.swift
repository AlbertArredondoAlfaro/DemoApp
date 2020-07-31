//
//  CoursesListViewController.swift
//  DomestikaTrailers
//
//  Created by Albert Arredondo Alfaro on 30/07/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import UIKit

class CoursesListViewController: BaseViewController {
    
    var presenter: CoursesListPresenterDelegate?
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        presenter?.viewDidLoad()
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
    func showLoader(_ show: Bool) {
        if show {
            showProgress(userInteractionEnabled: false)
        } else {
            hideProgress()
        }
    }
}
