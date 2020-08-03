//
//  TopView.swift
//  DomestikaTrailers
//
//  Created by Albert Arredondo Alfaro on 31/07/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import UIKit


protocol TopViewDelegate: class {
    func watchCourseTappedAtIndex(index: Int)
}

class TopView: UIView {
    
    private var index: Int?
    public weak var delegate: TopViewDelegate?
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private lazy  var button: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = .white
        button.setTitle("Watch", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 2
        button.addTarget(self, action: #selector(watchButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    func configure(with viewModel: CourseViewModel, at index: Int) {
        self.index = index
        titleLabel.text = viewModel.title
        if let urlString = viewModel.thumbnailUrl {
            imageView.sd_setImage(with: URL(string: urlString)) { (image, _, _, _) in
                if let image = image {
                    let croppedImage = self.cropToBounds(image: image, width: Double(self.frame.size.width), height: Double(self.frame.size.height))
                    self.imageView.image = croppedImage
                }
            }
        }
    }
    
    func cropToBounds(image: UIImage, width: Double, height: Double) -> UIImage {
        
        let contextImage: UIImage = UIImage(cgImage: image.cgImage!)
        let contextSize: CGSize = contextImage.size

        var posX: CGFloat = 0.0
        var posY: CGFloat = 0.0
        var cgwidth: CGFloat = CGFloat(width)
        var cgheight: CGFloat = CGFloat(height)

        // See what size is longer and create the center off of that
        if contextSize.width > contextSize.height {
            posX = ((contextSize.width - contextSize.height) / 2)
            posY = 0
            cgwidth = contextSize.height
            cgheight = contextSize.height
        } else {
            posX = 0
            posY = ((contextSize.height - contextSize.width) / 2)
            cgwidth = contextSize.width
            cgheight = contextSize.width
        }

        let rect: CGRect = CGRect(x: posX, y: posY, width: cgwidth, height: cgheight)

        // Create bitmap image from context using the rect
        let imageRef: CGImage = contextImage.cgImage!.cropping(to: rect)!

        // Create a new image based on the imageRef and rotate back to the original orientation
        let image: UIImage = UIImage(cgImage: imageRef, scale: image.scale, orientation: image.imageOrientation)

        return image
    }
    
}

// MARK: - Actions
extension TopView {
    @objc func watchButtonTapped() {
        if let index = index {
            delegate?.watchCourseTappedAtIndex(index: index)
        }
    }
}
   
// MARK: - Setup views
extension TopView {
    
    /**
     Setup views
     */
    private func setupViews() {
        //__ Configure your view here
        //__ Background color, title, safe area
        
        addSubviews()
    }
}

// MARK: - Layout & constraints
extension TopView {
    
    /**
     Add subviews
     */
    private func addSubviews() {
        addSubview(imageView)
        addSubview(button)
        addSubview(titleLabel)
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        button.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(30)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-40)
        }
        
        titleLabel.snp.makeConstraints {
            $0.bottom.equalTo(button.snp.top).offset(-20)
            $0.trailing.equalToSuperview().offset(-75)
            $0.leading.equalToSuperview().offset(75)
            $0.height.greaterThanOrEqualTo(0)
        }
    }
}
