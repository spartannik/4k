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
        button1.backgroundColor = .clear
        button1.layer.cornerRadius = 12
        button1.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button1
    }()

    public let myLabel: UILabel = {
        let label = UILabel()
//        label.text = """
//     Front door
//
//       """
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
    
    private let locked: UILabel = {
        let locked = UILabel()
        locked.text = "Locked"
        locked.textColor = .blue
        locked.font = .boldSystemFont(ofSize: 14)
        return locked
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

        sender.isSelected = !sender.isSelected

        if sender.isSelected {
            sender.setImage(UIImage(named:"Locked"), for: .normal)
        } else {
            sender.setImage(UIImage(named: "Unlocked"), for: .normal)
        }

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.backgroundColor = .clear
        contentView.addSubview(button1)
        contentView.addSubview(myLabel)
        contentView.addSubview(statusImage)
        contentView.addSubview(home)
        contentView.addSubview(lockedDoor)
        contentView.addSubview(locked)

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
        
        locked.snp.makeConstraints { make in
            make.left.equalTo(lockedDoor).inset(128)
            make.bottom.equalTo(myLabel).inset(-40)
        }

    }

    func didTap() {
        // didSelectRowAt

        // make logic unloc lock unlocking...

//        isSelected = !isSelected

        // lockedDoor
        // 1st UIImage(named: "lockedDoor")
        // 2st UIImage(named: "unlock")
        // 3st UIImage(named: "unlocking")

        // Door image right
        // 1st UIImage(named: "rightDoor")
        // 2st UIImage(named: "unlock")
        // 3st UIImage(named: "unlocking")

        // UNlocking label
        // 1st Locked
        // 2st unlock
        // 3st unlocking...

        processDoor()


    }

    func processDoor() {

        firstStateLockedDoor()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.thirdStateUnlockedDoor()
        }

        secodStateUnlockingProcessDoor()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.firstStateLockedDoor()
        }
    }


    func firstStateLockedDoor() {
        lockedDoor.image = UIImage(named: "lockedDoor")
        statusImage.image = UIImage(named: "statusDoor")
        locked.text = "Locked"
    }

    func secodStateUnlockingProcessDoor() {
        lockedDoor.image = UIImage(named: "Unlocking")
        statusImage.image = UIImage(named: "Spinner")
        locked.text = "Unlocking"
    }

    func thirdStateUnlockedDoor() {
        lockedDoor.image = UIImage(named: "shieldUnlocked")
        statusImage.image = UIImage(named: "Unlocked")
        locked.text = "Unlocked"
    }


//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        let imageSize = contentView.frame.size.height-55
//
//        myLabel.frame = CGRect(x: 75,
//                               y: 5,
//                               width: contentView.frame.size.width/2 ,
//                               height: contentView.frame.size.height/2)
//
//        statusImage.frame = CGRect(x: contentView.frame.size.width-imageSize, y: 20, width: imageSize, height: imageSize)
//
//        lockedDoor.frame = CGRect(x: 25, y: 20, width: 35, height: 35)
//
//        home.frame = CGRect(x: 75,
//                            y: 25,
//                            width: contentView.frame.size.width/2 ,
//                            height: contentView.frame.size.height/2)
//
//    }
    
}


