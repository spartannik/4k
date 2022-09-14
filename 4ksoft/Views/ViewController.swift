//
//  ViewController.swift
//  4ksoft
//
//  Created by Nikita Yashchenko on 29.08.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var doors = ["Front door", "Office","Otel", "Room","Room2", "Room3"]

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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubviews()
        setConstraints()
        tableViewConfig()
    }

    func tableViewConfig() {
        
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none

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
            make.top.equalTo(inerQRimage).inset(80)
            make.left.equalToSuperview().inset(24)
        }

        home.snp.makeConstraints { make in
            make.top.equalTo(shester).inset(40)
            make.left.equalTo(welcomeLabel).inset(180)
            make.right.equalToSuperview().inset(4)
        }

        myDoors.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel).inset(150)
            make.left.equalToSuperview().inset(25)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(myDoors).inset(30)
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
        
    }

    private func setupSubviews() {
        view.addSubview(inerQRimage)
        view.addSubview(shester)
        view.addSubview(welcomeLabel)
        view.addSubview(home)
        view.addSubview(myDoors)
        view.addSubview(tableView)
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return doors.count
     }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier) as! CustomTableViewCell
        let door = doors[indexPath.section]

        cell.myLabel.text = door
        cell.statusImage.image = UIImage(named: "statusDoor")

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? CustomTableViewCell {
            cell.didTap()
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }


}
