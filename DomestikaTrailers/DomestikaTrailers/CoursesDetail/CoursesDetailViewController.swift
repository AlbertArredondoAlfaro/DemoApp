//
//  CoursesDetailViewController.swift
//  DomestikaTrailers
//
//  Created by Albert Arredondo Alfaro on 03/08/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import UIKit
import AVKit

class CoursesDetailViewController: BaseViewController {
    
    var presenter: CoursesDetailPresenterDelegate?
    
    private var tableView: UITableView?
    private var datasource: CoursesDetailDatasource?
    
    var player: AVPlayer?
    var playerViewController: AVPlayerViewController = AVPlayerViewController()
    let seekDuration: Float64 = 10
    
    var goForwardButton: UIButton = {
        let button = UIButton.init(type: .roundedRect)
        button.setTitle("+10 sec", for: .normal)
        button.addTarget(self, action: #selector(goForward), for: .touchUpInside)
        button.setTitleColor(.primaryTextColor, for: .normal)
        return button
    }()
    
    var goBackwardButton: UIView = {
        let button = UIButton.init(type: .roundedRect)
        button.setTitle("-10 sec", for: .normal)
        button.addTarget(self, action: #selector(goBackward), for: .touchUpInside)
        button.setTitleColor(.primaryTextColor, for: .normal)
        return button
    }()
    
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
        self.view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.shouldRemoveShadow(true)
        		
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
        
        playerViewController.view.backgroundColor = .white
        
        registerCells()
        setupDatasource()
    }
    
    /**
     * Register all the cells we need
     */
    private func registerCells() {
        tableView?.register(CourseDescriptionCell.self, forCellReuseIdentifier: CourseDescriptionCell.identifier)
        tableView?.register(CourseDetailsCell.self, forCellReuseIdentifier: CourseDetailsCell.identifier)
        tableView?.register(CourseLevelCell.self, forCellReuseIdentifier: CourseLevelCell.identifier)
    }
    
    /**
     * Setup datasource for the tableView
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
        view.addSubview(tableView)
        view.addSubview(playerViewController.view)
        
        playerViewController.view.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(240)
        }
        
        view.addSubview(goForwardButton)
        view.addSubview(goBackwardButton)
        
        goBackwardButton.snp.makeConstraints {
            $0.top.equalTo(playerViewController.view.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(view.snp.centerX)
            $0.height.equalTo(21)
        }
        
        goForwardButton.snp.makeConstraints {
            $0.top.equalTo(playerViewController.view.snp.bottom)
            $0.trailing.equalToSuperview()
            $0.leading.equalTo(view.snp.centerX)
            $0.height.equalTo(21)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(goForwardButton.snp.bottom)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }

}

// MARK: - CoursesDetailViewInjection
extension CoursesDetailViewController: CoursesDetailViewInjection {
    func loadDataWithViewModel(with model: CourseViewModel) {
        
        guard let urlString = model.trailerUrl, let url = URL(string: urlString) else { return }
        player = AVPlayer(url: url)
        playerViewController.player = player
        player?.play()
        
        datasource?.viewModel = model
        tableView?.reloadData()
    }
}

// MARK: - Actions
extension CoursesDetailViewController {
    
    @objc func goForward() {
        guard let duration  = player?.currentItem?.duration else { return }
        guard let currentTime = player?.currentTime() else { return }
        
        let playerCurrentTime = CMTimeGetSeconds(currentTime)
        let newTime = playerCurrentTime + seekDuration

        if newTime < CMTimeGetSeconds(duration) {
            let time: CMTime = CMTimeMake(value: Int64(newTime * 1000 as Float64), timescale: 1000)
            player?.seek(to: time)
        }
    }
    
    @objc func goBackward() {
        guard let currentTime = player?.currentTime() else { return }
        let playerCurrentTime = CMTimeGetSeconds(currentTime)
        var newTime = playerCurrentTime - seekDuration

        if newTime < 0 {
            newTime = 0
        }
        
        let time: CMTime = CMTimeMake(value: Int64(newTime * 1000 as Float64), timescale: 1000)
        player?.seek(to: time)
    }
}
