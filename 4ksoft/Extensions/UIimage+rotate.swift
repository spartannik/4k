//
//  UIimage+rotate.swift
//  4ksoft
//
//  Created by Nikita Yashchenko on 19.09.2022.
//

import UIKit

extension UIView{
    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 3
        rotation.isCumulative = true
        rotation.repeatCount = 1
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}
