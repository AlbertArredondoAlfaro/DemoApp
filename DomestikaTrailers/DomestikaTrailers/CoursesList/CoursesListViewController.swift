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
    
    private lazy var topCarouselView = TopCarouselView()
    private lazy var bottomCarouselView = BottomCarouselView()
    
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
        self.view.backgroundColor = .white
        
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
        self.view.addSubview(topCarouselView)
        self.view.addSubview(bottomCarouselView)
        
        topCarouselView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.snp.centerY)
        }
        
        bottomCarouselView.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.top.equalTo(view.snp.centerY)
        }
    }

}

// MARK: - CoursesListViewInjection
extension CoursesListViewController: CoursesListViewInjection {
    func loadBottomCarouselView(_ courses: [CoursesListViewModel]) {
        DispatchQueue.main.async {
            self.bottomCarouselView.configure(with: courses)
        }
    }
    
    func loadTopCarouselView(_ courses: [CoursesListViewModel]) {
        DispatchQueue.main.async {
            self.topCarouselView.configure(with: courses)
        }
    }
    
    func showLoader(_ show: Bool) {
        if show {
            showProgress(userInteractionEnabled: false)
        } else {
            hideProgress()
        }
    }
}
