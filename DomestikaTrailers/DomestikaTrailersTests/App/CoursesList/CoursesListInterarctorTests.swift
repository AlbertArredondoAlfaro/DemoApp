//
//  CoursesListInterarctorTests.swift
//  DomestikaTrailersTests
//
//  Created by Albert Arredondo Alfaro on 04/08/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import XCTest
@testable import DomestikaTrailers

class CoursesListInterarctorTests: XCTestCase {
    
    // MARK: - Subject under test
    let interactor = CoursesListInteractor()
    private lazy var worker = CoursesListWorkerInjector()
}

extension CoursesListInterarctorTests {
    func testGetAssestsShouldAskWorkerToFetchAssets() {
        // Given
        interactor.coursesListWorker = worker
        
        // When
        interactor.getAssets { (_, _) in
        }

        // Then
        XCTAssertTrue(worker.fetchAssetsWasCalled)
    }
}

// MARK: - CoursesListWorkerInjector
private class CoursesListWorkerInjector: CoursesListWorker {
    var fetchAssetsWasCalled = false
    
    override func fetchAssets(_ successCallback: SuccessHandler<[DomestikaAsset]>, _ errorCallback: FailureHandler) {
        fetchAssetsWasCalled = true
    }
}

