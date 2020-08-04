//
//  CoursesListPresenterTests.swift
//  DomestikaTrailersTests
//
//  Created by Albert Arredondo Alfaro on 04/08/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import XCTest
@testable import DomestikaTrailers

class CoursesListPresenterTests: XCTestCase {
    
    // MARK: - Subject under test
    var presenter: CoursesListPresenter!
    
    private var view: CoursesListViewControllerInjector!
    private var interactor: CoursesListInteractorInjector!
    
    override func setUp() {
        
        super.setUp()
        
        view = CoursesListViewControllerInjector()
        interactor = CoursesListInteractorInjector()
        
        presenter = CoursesListPresenter(view: view)
        presenter.interactor = interactor
        
    }
    
    override func tearDown() {
        view = nil
        interactor = nil
        presenter = nil
        
        super.tearDown()
    }
}

extension CoursesListPresenterTests {
    func testViewDidLoadShouldAskInteractorForAssetsAndShouldAskViewToShowLoader() {
        // Given
        // When
        presenter.viewDidLoad()

        // Then
        XCTAssertTrue(view.showLoaderWasCalled)
        XCTAssertTrue(interactor.getAssetsWasCalled)
    }
}

// MARK: - CoursesListViewControllerInjector: CoursesListViewInjection
private class CoursesListViewControllerInjector: CoursesListViewInjection {
    var showLoaderWasCalled = false
    var loadTopCarouselViewWasCalled = false
    var loadBottomCarouselViewWasCalled = false
    
    func showLoader(_ show: Bool) {
        showLoaderWasCalled = true
    }
    
    func loadTopCarouselView(_ courses: [CourseViewModel]) {
        loadTopCarouselViewWasCalled = true
    }
    
    func loadBottomCarouselView(_ courses: [CourseViewModel]) {
        loadBottomCarouselViewWasCalled = true
    }
}

// MARK: - CoursesListInteractorInjector: CoursesListInteractorDelegate
private class CoursesListInteractorInjector: CoursesListInteractorDelegate {
    var getAssetsWasCalled = false
    func getAssets(completion: @escaping CoursesListGetAssetsCompletionBlock) {
        getAssetsWasCalled = true
    }
}
