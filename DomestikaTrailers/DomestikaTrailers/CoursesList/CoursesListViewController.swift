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
    
    private lazy var brandLogoImageView = UIImageView(image: UIImage(named: "Brand"))
    private lazy var searchImageView = UIImageView(image: UIImage(named: "Search"))
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

// MARK: - Setup views
extension CoursesListViewController {
    
    /**
     Setup views
     */
    private func setupViews() {
        self.view.backgroundColor = .white
        
        configureSubviews()
        addSubviews()
    }
    
    /**
     Configure subviews
     */
    private func configureSubviews() {
        topCarouselView.delegate = self
        bottomCarouselView.delegate = self
    }
    
}

// MARK: - Layout & constraints
extension CoursesListViewController {
    
    /**
     Add subviews
     */
    private func addSubviews() {
        view.addSubview(topCarouselView)
        view.addSubview(bottomCarouselView)
        view.addSubview(brandLogoImageView)
        view.addSubview(searchImageView)
        
        brandLogoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.leading.equalToSuperview().offset(30)
            $0.width.height.equalTo(38)
        }
    
        searchImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-10)
            $0.width.height.equalTo(78)
        }
        
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
    func loadBottomCarouselView(_ courses: [CourseViewModel]) {
        DispatchQueue.main.async {
            self.bottomCarouselView.configure(with: courses)
        }
    }
    
    func loadTopCarouselView(_ courses: [CourseViewModel]) {
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

// MARK: - TopCarouselViewDelegate
extension CoursesListViewController: TopCarouselViewDelegate {
    func watchCourseAtIndex(index: Int) {
        presenter?.watchTopCarouselCourse(at: index)
    }
}

// MARK: - BottomCarouselViewDelegate
extension CoursesListViewController: BottomCarouselViewDelegate {
    func watchCourseTappedAtIndex(index: Int) {
        presenter?.watchBottomCarouselCourse(at: index)
    }
}
