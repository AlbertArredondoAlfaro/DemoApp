//
//  BottomCarouselView.swift
//  DomestikaTrailers
//
//  Created by Albert Arredondo Alfaro on 31/07/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import UIKit

class BottomCarouselView: UIView {
    
    private let titleLabel: UILabel = UILabel()
    private var collectionView: UICollectionView?
    private var datasource: BottomDatasource?
        
    // MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    public func configure(with viewModel: [CoursesListViewModel]) {
        datasource?.items = viewModel
        collectionView?.reloadData()
    }
}

// MARK: - Setup views
extension BottomCarouselView {
    
    /**
     Setup views
     */
    private func setupViews() {
        //__ Configure your view here
        //__ Background color, title, safe area
        self.backgroundColor = .white
        
        configureSubviews()
        addSubviews()
    }
    
    /**
     * Configure subviews
     */
    private func configureSubviews() {
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        titleLabel.textColor = .black
        titleLabel.text = "Popular"
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: flowLayout)
        collectionView?.backgroundColor = .clear
        collectionView?.isUserInteractionEnabled = true
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.delegate = self
        
        registerCells()
        setupDatasource()
    }
    
    /**
     * Register all the cells we need
     */
    private func registerCells() {
        collectionView?.register(BottomCollectionViewCell.self, forCellWithReuseIdentifier: BottomCollectionViewCell.identifier)
    }
    
    /**
     * Setup datasource for the suggestions table view
     */
    private func setupDatasource() {
        if let collectionView = collectionView {
            datasource = BottomDatasource()
            //datasource?.delegate = self
            collectionView.dataSource = datasource
        }
    }
}

// MARK: - Layout & constraints
extension BottomCarouselView {
    
    /**
     Add subviews
     */
    private func addSubviews() {
        addSubview(titleLabel)

        titleLabel.snp.makeConstraints {
            $0.left.equalTo(20.0)
            $0.right.equalTo(-20.0)
            $0.top.equalToSuperview().offset(40)
            $0.height.equalTo(21.0)
        }
        
        if let collectionView = collectionView {
            addSubview(collectionView)
            collectionView.snp.makeConstraints {
                $0.left.equalToSuperview()
                $0.right.equalToSuperview()
                $0.bottom.equalToSuperview()
                $0.top.equalTo(titleLabel.snp.bottom)
            }
        }
    }
}

// MARK: - UICollectionViewDelegate (with UICollectionViewDelegateFlowLayout)
extension BottomCarouselView: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20.0, left: 20.0, bottom: 60.0, right: 20.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //delegate?.attachmentSelectedAt(indexPath.row)
    }

}
