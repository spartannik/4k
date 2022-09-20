//
//  ViewController.swift
//  4ksoft
//
//  Created by Nikita Yashchenko on 29.08.2022.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {

    var doors = [DoorsModel(doorName: "Front door", doorPlace: "Office"),
                 DoorsModel(doorName: "Back door", doorPlace: "Home"),
                 DoorsModel(doorName: "Front door", doorPlace: "Office"),
                 DoorsModel(doorName: "Back door", doorPlace: "Home"),
                 DoorsModel(doorName: "Front door", doorPlace: "Office")]

    // MARK: Labels

    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 35)
        return label
    } ()

    private let myDoors: UILabel = {
        let label = UILabel()
        label.text = "My doors"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        return label
    } ()

    // MARK: images

    private let interQR: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "InterQR")
        image.contentMode = .scaleAspectFit
        return image
    }()

    private let home: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Home")
        image.contentMode = .scaleAspectFit
        return image
    }()

    private let shester: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Shester")
        return image
    }()

    // MARK: tableView

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setConstraints()
        tableViewConfig()
    }

    private func setupSubviews() {
        view.backgroundColor = .white
        view.addSubview(interQR)
        view.addSubview(shester)
        view.addSubview(welcomeLabel)
        view.addSubview(home)
        view.addSubview(myDoors)
        view.addSubview(tableView)
    }

    private func tableViewConfig() {

        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none

        tableView.dataSource = self
        tableView.delegate = self
    }

    private func setConstraints() {

        interQR.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(80)
            make.left.equalToSuperview().inset(25)
        }

        shester.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(25)
            make.centerY.equalTo(interQR)
        }

        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(interQR).inset(80)
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
        cell.doorNameLabel.text = door.doorName
        cell.doorPlaceLabel.text = door.doorPlace

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 117
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
