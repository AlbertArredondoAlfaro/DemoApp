//
//  CoursesListViewControllerTests.swift
//  DomestikaTrailersTests
//
//  Created by Albert Arredondo Alfaro on 04/08/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import XCTest
@testable import DomestikaTrailers

class CoursesListViewControllerTests: XCTestCase {

    // MARK: - Subject under test
    var viewController = CoursesListViewController()
    
    var presenter = CoursesListPresenterInjector()
    
    var window: UIWindow!
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
    }
    
    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    func loadView() {
        
        viewController.presenter = presenter
        
        window.addSubview(viewController.view)
        RunLoop.current.run(until: Date())
    }
}

extension CoursesListViewControllerTests {
    func testShouldShowCoursesWhenViewDidLoad() {
        // Given
        loadView()
        
        // When
        // viewDidLoad was called on loadView()
        
        // Then
        XCTAssertTrue(presenter.viewDidLoadWasCalled, "Should fetch assets right after the viewDidLoad")
    }
}

// MARK: - Presenter Injector
class CoursesListPresenterInjector: CoursesListPresenterDelegate {
    var viewDidLoadWasCalled = false
    var watchTopCarouselCourseWasCalled = false
    var watchBottomCarouselCourseWasCalled = false
    
    func viewDidLoad() {
        viewDidLoadWasCalled = true
    }
    
    func watchTopCarouselCourse(at index: Int) {
        watchTopCarouselCourseWasCalled = true
    }
    
    func watchBottomCarouselCourse(at index: Int) {
        watchBottomCarouselCourseWasCalled = true
    }
}
