//
//  CustomTableViewCell.swift
//  4ksoft
//
//  Created by Nikita Yashchenko on 11.09.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"
    
    private lazy var button1: UIButton = {
        let button1 = UIButton()
        button1.layer.cornerRadius = 1
        button1.setTitleColor(UIColor.black, for: .normal)
        button1.setTitle("Locked", for: .normal)
        button1.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button1
    }()

    public let myLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    private let home: UILabel = {
        let label = UILabel()
        label.text = "Home"
        label.textColor = .black
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private let unlockedL: UILabel = {
        let label = UILabel()
        label.text = "Unlocked"
        label.textColor = .blue
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    public let unlocked: UIImageView = {
        let unlocked = UIImageView()
        unlocked.image = UIImage(named: "Unlocked")
        unlocked.contentMode = .scaleAspectFit
        unlocked.clipsToBounds = true
        return unlocked
    }()
    
    public let unlocking: UIImageView = {
        let unlocking = UIImageView()
        unlocking.image = UIImage(named: "Unlocking")
        unlocking.contentMode = .scaleAspectFit
        unlocking.clipsToBounds = true
        return unlocking
    }()
    
    public let statusImage: UIImageView = {
        let statusImage = UIImageView()
        statusImage.image = UIImage(named: "statusDoor")
        statusImage.contentMode = .scaleAspectFit
        statusImage.clipsToBounds = true
        return statusImage
    }()
    
    private let lockedDoor: UIImageView = {
        let lockedDoor = UIImageView()
        lockedDoor.image = UIImage(named: "lockedDoor")
        lockedDoor.contentMode = .scaleAspectFit
        lockedDoor.clipsToBounds = true
        return lockedDoor
    }()
    
    
    @objc func buttonTapped(sender: UIButton) {
        processDoor()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none
        contentView.backgroundColor = .clear
        contentView.addSubview(button1)
        contentView.addSubview(myLabel)
        contentView.addSubview(statusImage)
        contentView.addSubview(home)
        contentView.addSubview(lockedDoor)

        contentView.layer.cornerRadius = 15
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = UIColor.gray.cgColor

        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setConstraints() {

        lockedDoor.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.left.equalToSuperview().inset(30)
        }

        myLabel.snp.makeConstraints { make in
            make.left.equalTo(lockedDoor).inset(60)
            make.top.equalToSuperview().inset(22)
        }

        home.snp.makeConstraints { make in
            make.left.equalTo(lockedDoor).inset(60)
            make.bottom.equalTo(myLabel).inset(-10)
        }
        
        statusImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.right.equalToSuperview().inset(30)
        }
        
        button1.snp.makeConstraints { make in
            make.left.equalTo(lockedDoor).inset(128)
            make.bottom.equalTo(myLabel).inset(-40)
        }

    }

    func didTap() {
        processDoor()
    }

    func processDoor() {

        firstStateLockedDoor()

        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.thirdStateUnlockedDoor()
        }

        secodStateUnlockingProcessDoor()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
            self.firstStateLockedDoor()
        }
    }


    func firstStateLockedDoor() {
        lockedDoor.image = UIImage(named: "lockedDoor")
        statusImage.image = UIImage(named: "statusDoor")
        button1.setTitle("Locked", for: .normal)
    }

    func secodStateUnlockingProcessDoor() {
        lockedDoor.image = UIImage(named: "Unlocking")
        statusImage.image = UIImage(named: "Spinner")
        button1.setTitle("Unlocking", for: .normal)
    }

    func thirdStateUnlockedDoor() {
        lockedDoor.image = UIImage(named: "shieldUnlocked")
        statusImage.image = UIImage(named: "Unlocked")
        button1.setTitle("Unlocked", for: .normal)
    }
}

