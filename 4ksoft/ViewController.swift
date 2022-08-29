//
//  ViewController.swift
//  4ksoft
//
//  Created by Nikita Yashchenko on 29.08.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         initialize()

    }

    private func initialize() {
        view.backgroundColor = UIColor(white: 100, alpha: 1)
        
        let label1 = UILabel()
        label1.text = "Inter"
        view.addSubview(label1)
        label1.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(24)
            maker.top.equalToSuperview().inset(77.3)
            
       let label = UILabel()
            label.text = "QR"
            view.addSubview(label)
            label.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(76.75)
            maker.right.equalTo(label1.snp.right).inset(4.09)
            maker.top.equalToSuperview().inset(77)
        }
    }

}

}
