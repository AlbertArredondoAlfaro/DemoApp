//
//  UINavigationBar+Theme.swift
//  DomestikaTrailers
//
//  Created by Albert Arredondo Alfaro on 03/08/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import UIKit

extension UINavigationBar {
    func shouldRemoveShadow(_ value: Bool) {
        self.setValue(value, forKey: "hidesShadow")
    }
}
