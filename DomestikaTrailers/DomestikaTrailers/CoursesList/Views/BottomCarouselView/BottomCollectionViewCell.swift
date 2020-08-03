//
//  BottomView.swift
//  DomestikaTrailers
//
//  Created by Albert Arredondo Alfaro on 31/07/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import UIKit

class BottomCollectionViewCell: UICollectionViewCell {
    
    static public var identifier: String {
        return String(describing: self)
    }
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .justified
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    
    // MARK: Lifecycle
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}

// MARK: - Setup views
extension BottomCollectionViewCell {
    
    /**
     * Setup views
     */
    private func setupViews() {
        backgroundColor = .white
        
        configureSubviews()
        addSubviews()
        
        applyShadow(.type1)
        applyRoundedCorner(.bottom)
    }
    
    /**
     * Configure subviews
     */
    private func configureSubviews() {
        
    }
    
    /**
     * Bind component
     *
     * - parameters:
     *      -viewModel: CoursesListViewModel
     *      -index: the current index
     */
    public func bindWithViewModel(_ viewModel: CoursesListViewModel, at index: Int) {
        guard let urlString = viewModel.thumbnailUrl else {
            // Or configure with a placeholder image
            return
        }
        self.imageView.sd_setImage(with: URL(string: urlString))
        self.titleLabel.text = viewModel.title
        
        //self.index = index
        
        self.imageView.applyRoundedCorner(.top)
    }
}

// MARK: - Layout & constraints
extension BottomCollectionViewCell {
    
    /**
     Add subviews
     */
    private func addSubviews() {
        addSubview(imageView)
        addSubview(titleLabel)
        
        imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(self.snp.centerY)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.greaterThanOrEqualTo(0)
        }
    }

}
