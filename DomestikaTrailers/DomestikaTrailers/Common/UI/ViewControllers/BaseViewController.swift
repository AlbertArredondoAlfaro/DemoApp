//
//  BaseViewController.swift
//  DomestikaTrailers
//
//  Created by Albert Arredondo Alfaro on 31/07/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import UIKit
import SVProgressHUD
import SnapKit
import SDWebImage

class BaseViewController: UIViewController {

}

// MARK: - SVProgressHUD
extension BaseViewController {
    
    public func showProgress() {
        showProgress(userInteractionEnabled: true)
    }
    
    public func showProgress(userInteractionEnabled: Bool) {
        SVProgressHUD.setDefaultMaskType(userInteractionEnabled ? .none : .clear)
        SVProgressHUD.show()
    }
        
    public func hideProgress() {
        SVProgressHUD.dismiss()
    }
}

