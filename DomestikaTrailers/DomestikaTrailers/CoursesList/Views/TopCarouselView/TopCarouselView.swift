//
//  CourseTopView.swift
//  DomestikaTrailers
//
//  Created by Albert Arredondo Alfaro on 31/07/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import UIKit

protocol TopCarouselViewDelegate: class {
    func watchCourseAtIndex(index: Int)
}

class TopCarouselView: UIView {
    
    public weak var delegate: TopCarouselViewDelegate?
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.delegate = self
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.contentInsetAdjustmentBehavior = .never
        return scrollView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 0
        return stackView
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .white
        pageControl.pageIndicatorTintColor = UIColor.white.withAlphaComponent(0.5)
        pageControl.isUserInteractionEnabled = false
        return pageControl
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
    
    func configure(with viewModel: [CourseViewModel]) {
        for (index, model) in viewModel.enumerated() {
            let topView = TopView()
            topView.configure(with: model, at: index)
            stackView.addArrangedSubview(topView)
            topView.snp.makeConstraints {
                $0.width.equalTo(scrollView.snp.width)
                $0.height.equalTo(scrollView.snp.height)
            }
            topView.delegate = self
        }
        
        pageControl.numberOfPages = viewModel.count
        pageControl.currentPage = 0
    }
}

// MARK: - Setup views
extension TopCarouselView {
    
    /**
     Setup views
     */
    private func setupViews() {
        //__ Configure your view here
        //__ Background color, title, safe area
        self.backgroundColor = .clear
        
        addSubviews()
    }
}

// MARK: - Layout & constraints
extension TopCarouselView {
    
    /**
     Add subviews
     */
    private func addSubviews() {
        self.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        scrollView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        self.addSubview(pageControl)
        pageControl.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-5)
        }
    }

}

extension TopCarouselView: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
}

// MARK: - TopViewDelegate
extension TopCarouselView: TopViewDelegate {
    func watchCourseTappedAtIndex(index: Int) {
        delegate?.watchCourseAtIndex(index: index)
    }
}

