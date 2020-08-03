//
//  UIVIew+Rounded.swift
//  DomestikaTrailers
//
//  Created by Albert Arredondo Alfaro on 31/07/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import UIKit

enum CardRoundedCornerStyle {
    case top
    case bottom
    case all
    case none
}

extension UIView {

    private static let roundedCornerRadius: CGFloat = 5

    func applyRoundedCorner(_ cardRoundedCornerStyle: CardRoundedCornerStyle) {
        switch cardRoundedCornerStyle {
        case .top:
            layer.cornerRadius = UIView.roundedCornerRadius
            layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        case .bottom:
            layer.cornerRadius = UIView.roundedCornerRadius
            layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        case .all:
            layer.cornerRadius = UIView.roundedCornerRadius
            layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        case .none:
            layer.cornerRadius = 0
            layer.maskedCorners = []
        }
    }
}
