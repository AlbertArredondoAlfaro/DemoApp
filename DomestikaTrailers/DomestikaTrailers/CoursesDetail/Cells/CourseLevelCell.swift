//
//  CourseLevelCell.swift
//  DomestikaTrailers
//
//  Created by Albert Arredondo Alfaro on 03/08/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import UIKit

class CourseLevelCell: UITableViewCell {
    
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
    
    private lazy var levelLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.textColor = .white
        return label
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
extension CourseLevelCell {
    
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
    public func bindWithDetail(_ levelText: String, detailImage: String, levelColor: LevelColor) {
        detailTitleLabel.text = "Level"
        detailImageView.image = UIImage(named: detailImage)
        levelLabel.text = levelText.uppercased()
        levelLabel.backgroundColor = levelColor.value
    }
}

// MARK: - Layout & constraints
extension CourseLevelCell {
    
    /**
     Add subviews
     */
    private func addSubviews() {
        addSubview(detailTitleLabel)
        addSubview(detailImageView)
        addSubview(levelLabel)
        
        detailImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.height.width.equalTo(24)
        }
        
        detailTitleLabel.snp.makeConstraints {
            $0.centerY.equalTo(detailImageView.snp.centerY)
            $0.width.equalTo(40)
            $0.leading.equalTo(detailImageView.snp.trailing).offset(5)
            $0.height.greaterThanOrEqualTo(0)
        }
        
        levelLabel.snp.makeConstraints {
            $0.centerY.equalTo(detailImageView.snp.centerY)
            $0.width.equalTo(100)
            $0.leading.equalTo(detailTitleLabel.snp.trailing)
            $0.height.equalTo(20)
        }
        
        levelLabel.layer.cornerRadius = 10
    }
}
