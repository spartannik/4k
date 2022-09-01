//
//  Extension.swift
//  4ksoft
//
//  Created by Nikita Yashchenko on 01.09.2022.
//

import Foundation
import UIKit

extension UIView {
       func addToView(view: UIView) {
           translatesAutoresizingMaskIntoConstraints = false
           view.addSubview(self)
       }
   }
