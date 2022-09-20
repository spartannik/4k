//
//  CustomTableViewCell.swift
//  4ksoft
//
//  Created by Nikita Yashchenko on 11.09.2022.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {

    static let identifier = "CustomTableViewCell"

    let doorNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Locked"
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()

    let doorPlaceLabel: UILabel = {
        let label = UILabel()
        label.text = "Home"
        label.textColor = UIColor(rgb: 0xB9B9B9)
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var doorStatusButton: UIButton = {
        let button = UIButton()
        let color = UIColor(rgb: 0x00448)
        button.setTitleColor(color, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.setTitle("Locked", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()

    private let lockedShieldDoor: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "lockedDoor")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()

    private let statusImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "statusDoor")
        image.contentMode = .scaleAspectFit
        return image
    }()

    @objc func buttonTapped(sender: UIButton) {
        processDoor()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none
        contentView.backgroundColor = .clear
        contentView.addSubview(doorStatusButton)
        contentView.addSubview(doorNameLabel)
        contentView.addSubview(statusImage)
        contentView.addSubview(doorPlaceLabel)
        contentView.addSubview(lockedShieldDoor)

        contentView.layer.cornerRadius = 15
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = UIColor.gray.cgColor

        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setConstraints() {

        lockedShieldDoor.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.left.equalToSuperview().inset(30)
        }

        doorNameLabel.snp.makeConstraints { make in
            make.left.equalTo(lockedShieldDoor).inset(60)
            make.top.equalToSuperview().inset(22)
        }

        doorPlaceLabel.snp.makeConstraints { make in
            make.left.equalTo(lockedShieldDoor).inset(60)
            make.bottom.equalTo(doorNameLabel).inset(-15)
        }

        statusImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.right.equalToSuperview().inset(30)
        }

        doorStatusButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(10)
            make.centerX.equalToSuperview()

        }

    }

    func didTap() {
        processDoor()
    }

    private func processDoor() {

        firstStateLockedDoor()

        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.thirdStateUnlockedDoor()
        }

        secodStateUnlockingProcessDoor()

        DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
            self.firstStateLockedDoor()
        }
    }

    private func firstStateLockedDoor() {
        lockedShieldDoor.image = UIImage(named: "lockedDoor")
        statusImage.image = UIImage(named: "statusDoor")
        doorStatusButton.setTitle("Locked", for: .normal)
        doorStatusButton.alpha = 1
    }

    private func secodStateUnlockingProcessDoor() {
        lockedShieldDoor.image = UIImage(named: "Unlocking")
        statusImage.image = UIImage(named: "Spinner")
        statusImage.rotate()
        doorStatusButton.setTitle("Unlocking...", for: .normal)
        doorStatusButton.alpha = 0.5
     }

    private func thirdStateUnlockedDoor() {
        lockedShieldDoor.image = UIImage(named: "shieldUnlocked")
        statusImage.image = UIImage(named: "Unlocked")
        doorStatusButton.setTitle("Unlocked", for: .normal)
        doorStatusButton.alpha = 1
    }
}
