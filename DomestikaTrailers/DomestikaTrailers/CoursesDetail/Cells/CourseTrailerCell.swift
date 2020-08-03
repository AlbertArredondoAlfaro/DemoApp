//
//  CourseDetailVideoCell.swift
//  DomestikaTrailers
//
//  Created by Albert Arredondo Alfaro on 03/08/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import UIKit

class CourseTrailerCell: UITableViewCell {
    
    static public var identifier: String {
        return String(describing: self)
    }
    
    private lazy var thumbailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    // MARK: Lifecycle
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
extension CourseTrailerCell {
    
    /**
     * Setup views
     */
    private func setupViews() {
        backgroundColor = .white
        
        configureSubviews()
        addSubviews()
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
    public func bindWithViewModel(_ viewModel: CourseViewModel, at index: Int) {
        guard let urlString = viewModel.thumbnailUrl else {
            // Or configure with a placeholder image
            return
        }
        self.thumbailImageView.sd_setImage(with: URL(string: urlString))
    }
}

// MARK: - Layout & constraints
extension CourseTrailerCell {
    
    /**
     Add subviews
     */
    private func addSubviews() {
        addSubview(thumbailImageView)
        
        thumbailImageView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(225)
        }
    }
}
