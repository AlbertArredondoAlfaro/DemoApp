//
//  BackButton.swift
//  DomestikaTrailers
//
//  Created by Albert Arredondo Alfaro on 03/08/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import UIKit

class BackButton: UIButton {
    
    private let backImageView: UIImageView = UIImageView()
    
    required init(tintColor: UIColor? = nil) {
        super.init(frame: .zero)
        setupViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
}

extension BackButton {
    
    private func setupViews() {
        configureSubviews()
        addSubviews()
    }
    
    private func configureSubviews() {
        backImageView.image = UIImage(named: "Back")
    }
    
    private func addSubviews() {
        addSubview(backImageView)
        
        backImageView.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.width.equalTo(17.0)
            $0.height.equalTo(14.0)
            $0.centerY.equalToSuperview()
        }
    }
    
}
