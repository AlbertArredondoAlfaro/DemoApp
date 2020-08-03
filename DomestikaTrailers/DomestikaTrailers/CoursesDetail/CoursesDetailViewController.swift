//
//  CoursesDetailViewController.swift
//  DomestikaTrailers
//
//  Created by Albert Arredondo Alfaro on 03/08/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import UIKit

class CoursesDetailViewController: BaseViewController {
    
    var presenter: CoursesDetailPresenterDelegate?
    
    private var tableView: UITableView?
    private var datasource: CoursesDetailDatasource?
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
        presenter?.viewDidLoad()
    }
    
}

// MARK: - Setup views
extension CoursesDetailViewController {
    
    /**
     Setup views
     */
    private func setupViews() {
        self.view.backgroundColor = .red
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        		
        //__ Create a custom back button
        let backButton = BackButton()
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        //__ Set the left bar button item
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
        // TODO: implement behaviour of the button when client specify it
        let rightBarButton = UIBarButtonItem.init(image: UIImage(named: "Share"), style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = rightBarButton
            
        configureSubviews()
        addSubviews()
    }
        
    @objc private func backButtonPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    /**
     Configure subviews
     */
    private func configureSubviews() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView?.separatorStyle = .none
        tableView?.rowHeight = UITableView.automaticDimension
        tableView?.backgroundColor = .clear
        tableView?.showsVerticalScrollIndicator = false
        
        registerCells()
        setupDatasource()
    }
    
    /**
     * Register all the cells we need
     */
    private func registerCells() {
        tableView?.register(CourseDetailVideoCell.self, forCellReuseIdentifier: CourseDetailVideoCell.identifier)
    }
    
    /**
     * Setup datasource for the collectionView
     */
    private func setupDatasource() {
        datasource = CoursesDetailDatasource()
        tableView?.dataSource = datasource
    }
    
}

// MARK: - Layout & constraints
extension CoursesDetailViewController {
    
    /**
     Add subviews
     */
    private func addSubviews() {
        guard let tableView = tableView else { return }
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}

// MARK: - CoursesDetailViewInjection
extension CoursesDetailViewController: CoursesDetailViewInjection {
    func loadDataWithViewModel(with model: CourseViewModel) {
        datasource?.viewModel = model
        tableView?.reloadData()
    }
}
