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
        label1.font = UIFont.systemFont(ofSize: 20)
        label1.textColor = UIColor(red: 0.655, green: 0.659, blue: 0.667, alpha: 1)
        view.addSubview(label1)
        label1.snp.makeConstraints { maker in
            maker.left.equalToSuperview().offset(24)
            maker.top.equalToSuperview().offset(77.3)
            
       let label = UILabel()
            label.text = "QR"
            label.font = UIFont.systemFont(ofSize: 20)
            label.textColor = UIColor(red: 0, green: 0.561, blue: 0.827, alpha: 1)
            view.addSubview(label)
            label.snp.makeConstraints { maker in
                maker.top.equalToSuperview().offset(77.3)
                maker.left.equalTo(label1.snp.right).offset(4)
                
      let label2 = UILabel()
          label2.text = "Welcome"
          label2.font = UIFont.boldSystemFont(ofSize: 35)
          label2.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
          view.addSubview(label2)
          label2.snp.makeConstraints { make in
              maker.top.equalTo(label).offset(450)
              maker.left.equalTo(label).inset(24)
                    
                }
        }
    }

}

}

