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
        setupSubviews()
        setConstraints()
        }

    //  Labels
    
    private lazy var welcomeLabel: UILabel = {
        let welcomeLabel = UILabel()
        welcomeLabel.text = "Welcome"
        welcomeLabel.textColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1)
        welcomeLabel.sizeToFit()
        welcomeLabel.font = .boldSystemFont(ofSize: 35)
        return welcomeLabel
    } ()
    
    private lazy var myDoors: UILabel = {
        let myDoors = UILabel()
        myDoors.text = "My doors"
        myDoors.textColor = UIColor(red: 0.2, green: 0.22, blue: 0.33, alpha: 1)
        myDoors.sizeToFit()
        myDoors.font = .boldSystemFont(ofSize: 20)
        return myDoors
    } ()
    
    //images
    
    private lazy var image1: UIImageView = {
        let image1 = UIImageView()
        image1.image = UIImage(named: "Image-1")
        image1.contentMode = .scaleAspectFit
        return image1
    }()
    
    private lazy var image2: UIImageView = {
        let image2 = UIImageView()
        image2.image = UIImage(named: "Image-2")
        image2.contentMode = .scaleAspectFit
        return image2
    }()
    
    private lazy var image3: UIImageView = {
        let image3 = UIImageView()
        image3.image = UIImage(named: "Image-3")
        image3.contentMode = .bottom
        return image3
    }()
    
    private lazy var view1: UIView = {
        let view1 = UIView()
        view1.backgroundColor = .blue
        view1.contentMode = .scaleAspectFit
        return view1
    }()

    private func setConstraints() {
        image1.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(77)
            make.left.equalToSuperview().inset(24)
            make.right.equalToSuperview().inset(265)
        }
        
        image3.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(63)
            make.left.equalToSuperview().inset(303)
            make.right.equalToSuperview().inset(27)
        }
        
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(250)
            make.left.equalToSuperview().inset(24)
            make.right.equalToSuperview().inset(203)
        }
        
        image2.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(108)
            make.left.equalToSuperview().inset(190)
            make.right.equalToSuperview().inset(4)
        }
        
        myDoors.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(400)
            make.left.equalToSuperview().inset(25)
            make.right.equalToSuperview().inset(265)
        }
        
        view1.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(445)
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(16)
            make.width.equalTo(344)
            make.height.equalTo(117)
        }
    }
    
    private func setupSubviews() {
        view.addSubview(image1)
        view.addSubview(image3)
        view.addSubview(welcomeLabel)
        view.addSubview(image2)
        view.addSubview(myDoors)
        view.addSubview(view1)
    }
    
}
