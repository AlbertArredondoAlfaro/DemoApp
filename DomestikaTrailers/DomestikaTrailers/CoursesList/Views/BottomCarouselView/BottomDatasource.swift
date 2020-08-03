//
//  BottomDatasource.swift
//  DomestikaTrailers
//
//  Created by Albert Arredondo Alfaro on 03/08/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import UIKit

class BottomDatasource: NSObject {
    
    //public weak var delegate: AttachmentsDatasourceDelegate?
    public var items: [CoursesListViewModel]
    
    public override init() {
        self.items = []
        super.init()
    }
}

// MARK: - Private section
extension BottomDatasource {
    
    /**
     * Generate cell for Courses
     *
     * - parameters:
     *      -viewModel: CoursesListViewModel view model
     *      -collectionView: the current collection view
     *      -indexPath: index path to process
     */
    private func generateCellForCourseWithViewModel(_ viewModel: CoursesListViewModel, in collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BottomCollectionViewCell.identifier, for: indexPath) as? BottomCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.bindWithViewModel(viewModel, at: indexPath.row)
        
        return cell
    }
}

// MARK: - UICollectionViewDataSource
extension BottomDatasource: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let viewModel = items[indexPath.row]
        return generateCellForCourseWithViewModel(viewModel, in: collectionView, at: indexPath)
    }
    
}
