//
//  CourseDetailItemCell.swift
//  DomestikaTrailers
//
//  Created by Albert Arredondo Alfaro on 03/08/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import UIKit

class CourseDetailsCell: UITableViewCell {
    
    static public var identifier: String {
        return String(describing: self)
    }
    
    private lazy var detailTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textAlignment = .left
        label.textColor = .primaryTextColor
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var detailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
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
extension CourseDetailsCell {
    
    /**
     * Setup views
     */
    private func setupViews() {
        backgroundColor = .white
        addSubviews()
    }
    
    /**
     * Bind component
     */
    public func bindWithDetail(_ detailText: String, detailImage: String) {
        detailTitleLabel.text = detailText
        detailImageView.image = UIImage(named: detailImage)
    }
}

// MARK: - Layout & constraints
extension CourseDetailsCell {
    
    /**
     Add subviews
     */
    private func addSubviews() {
        addSubview(detailTitleLabel)
        addSubview(detailImageView)
        
        detailImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.height.width.equalTo(24)
        }
        
        detailTitleLabel.snp.makeConstraints {
            $0.centerY.equalTo(detailImageView.snp.centerY)
            $0.leading.equalTo(detailImageView.snp.trailing).offset(5)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.greaterThanOrEqualTo(0)
        }
    }
}
