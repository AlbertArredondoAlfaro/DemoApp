//
//  ViewController.swift
//  DomestikaTrailers
//
//  Created by Albert Arredondo Alfaro on 30/07/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        
        guard let url = URL(string: "http://mobile-assets.domestika.org/challenge/home.json") else { return }
        NetworkManager.shared.loadAssets(from: url) { (response: NetworkResult<DomestikaAsset>) in
            switch response {
            case .success(let assets):
                print(assets)
            case .failure(let error):
                print(error.debugDescription)
            }
        }
    }


}

