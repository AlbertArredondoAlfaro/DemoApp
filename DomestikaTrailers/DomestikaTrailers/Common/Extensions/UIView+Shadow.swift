//
//  UIView+Shadow.swift
//  DomestikaTrailers
//
//  Created by Albert Arredondo Alfaro on 31/07/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import UIKit

enum ShadowType {
    case type1
}

extension UIView {
    
    func applyShadow(_ shadowType: ShadowType) {
        switch shadowType {
        case .type1:
            clipsToBounds = false
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
            layer.shadowOpacity = 0.15
            self.applyRoundedCorner(.all)
        }
    }
}
