//
//  CourseDetailGeneralCell.swift
//  DomestikaTrailers
//
//  Created by Albert Arredondo Alfaro on 03/08/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import UIKit

class CourseDescriptionCell: UITableViewCell {
    
    static public var identifier: String {
        return String(describing: self)
    }
    
    private lazy var courseTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textAlignment = .left
        label.textColor = .primaryTextColor
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var courseDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textAlignment = .left
        label.textColor = .secondaryTextColor
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var teacherLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .left
        label.textColor = .primaryTextColor
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textAlignment = .left
        label.textColor = .secondaryTextColor
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let separatorLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lineSeparatorColor
        return view
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
extension CourseDescriptionCell {
    
    /**
     * Setup views
     */
    private func setupViews() {
        backgroundColor = .white
        addSubviews()
    }
    
    /**
     * Bind component
     *
     * - parameters:
     *      -viewModel: CoursesListViewModel
     *      -index: the current index
     */
    public func bindWithViewModel(_ viewModel: CourseViewModel, at index: Int) {
        courseTitleLabel.text = viewModel.title
        courseDescriptionLabel.text = viewModel.courseDescription
        teacherLabel.text = viewModel.teacherName
        locationLabel.text = viewModel.location
        
        guard let urlString = viewModel.teacherAvatarUrl, let url = URL (string: urlString) else { return }
        avatarImageView.sd_setImage(with: url)
    }
}

// MARK: - Layout & constraints
extension CourseDescriptionCell {
    
    /**
     Add subviews
     */
    private func addSubviews() {
        addSubview(courseTitleLabel)
        addSubview(courseDescriptionLabel)
        addSubview(teacherLabel)
        addSubview(locationLabel)
        addSubview(avatarImageView)
        addSubview(separatorLineView)
        
        courseTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.greaterThanOrEqualTo(0)
        }
        
        courseDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(courseTitleLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.greaterThanOrEqualTo(0)
        }
        
        teacherLabel.snp.makeConstraints {
            $0.top.equalTo(courseDescriptionLabel.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-70)
            $0.height.greaterThanOrEqualTo(0)
        }
        
        locationLabel.snp.makeConstraints {
            $0.top.equalTo(teacherLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-70)
            $0.height.greaterThanOrEqualTo(0)
        }
        
        avatarImageView.snp.makeConstraints {
            $0.centerY.equalTo(locationLabel.snp.centerY)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.width.equalTo(50)
        }

        avatarImageView.layer.cornerRadius = 25
        
        separatorLineView.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.bottom).offset(50)
            $0.trailing.leading.equalToSuperview()
            $0.height.equalTo(1)
            $0.bottom.equalToSuperview()
        }
    }
}
