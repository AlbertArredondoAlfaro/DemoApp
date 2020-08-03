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
        label.textAlignment = .left
        label.textColor = .primaryTextColor
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private lazy var teacherLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textAlignment = .left
        label.textColor = .secondaryTextColor
        label.numberOfLines = 0
        return label
    }()
    
    private let separatorLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lineSeparatorColor
        return view
    }()
    
    private lazy var watchCourseLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textAlignment = .left
        label.textColor = .primaryTextColor
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var disclousureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "main-disclosure")
        return imageView
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
    
    static func getHeight(for width: CGFloat) -> CGFloat {
        return width / 0.9
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
        watchCourseLabel.text = "Ver curso"
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
        self.imageView.sd_setImage(with: URL(string: urlString))
        self.titleLabel.text = viewModel.title
        if let name = viewModel.teacherName {
            self.teacherLabel.text = String(format: "de %@", name)
        }
        
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
        addSubview(teacherLabel)
        addSubview(separatorLineView)
        addSubview(watchCourseLabel)
        addSubview(disclousureImageView)
        
        imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(self.snp.centerY)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.greaterThanOrEqualTo(0)
        }
        
        teacherLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.greaterThanOrEqualTo(0)
        }
        
        watchCourseLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-20)
            $0.leading.equalTo(20)
            $0.trailing.equalToSuperview()
            $0.height.greaterThanOrEqualTo(0)
        }
        
        disclousureImageView.snp.makeConstraints {
            $0.centerY.equalTo(watchCourseLabel.snp.centerY)
            $0.height.width.equalTo(15)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        separatorLineView.snp.makeConstraints {
            $0.bottom.equalTo(watchCourseLabel.snp.top).offset(-15)
            $0.trailing.leading.equalToSuperview()
            $0.height.equalTo(1)
        }
    }

}
