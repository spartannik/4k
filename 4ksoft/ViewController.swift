//
//  ViewController.swift
//  4ksoft
//
//  Created by Nikita Yashchenko on 29.08.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var Doors = ["Home", "Office",]
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        let door = Doors[indexPath.row]
        
        cell.myLabel.text = "Front Door"
        cell.statusImage.image = UIImage(named: "statusDoor")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    

    //  Labels

    private lazy var welcomeLabel: UILabel = {
        let welcomeLabel = UILabel()
        welcomeLabel.text = "Welcome"
        welcomeLabel.textColor = .black //.init(hexString: "")
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

    private lazy var inerQRimage: UIImageView = {
        let image1 = UIImageView()
        image1.image = UIImage(named: "InterQR")
        image1.contentMode = .scaleAspectFit
        return image1
    }()

    private lazy var home: UIImageView = {
        let image2 = UIImageView()
        image2.image = UIImage(named: "Home")
        image2.contentMode = .scaleAspectFit
        return image2
    }()

    private lazy var shester: UIImageView = {
        let image3 = UIImageView()
        image3.image = UIImage(named: "Shester")
        return image3
    }()

    private lazy var view1: UIView = {
        let view1 = UIView()
        view1.layer.cornerRadius = 20
        view1.backgroundColor = .clear
        view1.contentMode = .scaleAspectFit
        return view1
    }()

    private lazy var image4: UIImageView = {
        let image4 = UIImageView()
        image4.image = UIImage(named: "Locked")
        image4.contentMode = .scaleAspectFill
        return image4
    }()

    private lazy var image5: UIImageView = {
        let image5 = UIImageView()
        image5.image = UIImage(named: "Unlocked")
        image5.contentMode = .scaleAspectFill
        return image5
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CustomTableViewCell.self,
                           forCellReuseIdentifier: CustomTableViewCell.identifier)
        return tableView
    }()
    
    

//    func delayfunc() {
//        activityIndicator.startAnimating()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { // Change `2.0` to the desired number of seconds.
            // Code you want to be delayed
//            self.activityIndicator.stopAnimating()
//        }
//    }

    // activity indicator


//    private lazy var activityIndicator: UIActivityIndicatorView = {
//        let activityIndicator = UIActivityIndicatorView()
//        activityIndicator.color = .black
//        return activityIndicator
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setConstraints()
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func setConstraints() {

        inerQRimage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(80)
            make.left.equalToSuperview().inset(25)
        }

        shester.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(25)
            make.centerY.equalTo(inerQRimage)
        }

        welcomeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(157)
            make.left.equalToSuperview().inset(24)
        }

        home.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(108)
            make.left.equalToSuperview().inset(190)
            make.right.equalToSuperview().inset(4)
        }

        myDoors.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(307)
            make.left.equalToSuperview().inset(25)
            make.right.equalToSuperview().inset(265)
        }

//        image4.snp.makeConstraints { make in
//            make.top.equalToSuperview().inset(478)
//            make.left.equalToSuperview().inset(16)
//            make.right.equalToSuperview().inset(16)
//            make.width.equalTo(50)
//            make.height.equalTo(50)
//        }

//        image5.snp.makeConstraints { make in
//            make.top.equalToSuperview().inset(478)
//            make.left.equalToSuperview().inset(16)
//            make.right.equalToSuperview().inset(16)
//            make.width.height.equalTo(image4)
//       }

//        activityIndicator.snp.makeConstraints { make in
//            make.top.equalToSuperview().inset(476)
//            make.left.equalToSuperview().inset(16)
//            make.right.equalToSuperview().inset(16)
//            make.width.equalTo(50)
//            make.height.equalTo(50)
//        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(360)
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(16)
            make.width.equalTo(300)
            make.height.equalTo(400)
        }
        
    }

    private func setupSubviews() {
        view.addSubview(inerQRimage)
        view.addSubview(shester)
        view.addSubview(welcomeLabel)
        view.addSubview(home)
        view.addSubview(myDoors)
//        view.addSubview(image4)
//        view.addSubview(image5)
//        view.addSubview(button1)
//        view.addSubview(activityIndicator)
        view.addSubview(tableView)
    }

}

