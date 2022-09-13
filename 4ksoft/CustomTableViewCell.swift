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
//        label.text = "Home"
        label.textColor = .black
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    public let statusImage: UIImageView = {
        let statusImage = UIImageView()
 //       statusImage.image = UIImage(named: "statusDoor")
        statusImage.contentMode = .scaleAspectFit
        statusImage.clipsToBounds = true
        return statusImage
    }()
    
    private let lockedDoor: UIImageView = {
        let statusImage = UIImageView()
 //       statusImage.image = UIImage(named: "lockedDoor")
        statusImage.contentMode = .scaleAspectFit
        statusImage.clipsToBounds = true
        return statusImage
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(text: String, imageName: String) {
        myLabel.text = text
        home.text = text
        statusImage.image = UIImage(named: imageName)
        lockedDoor.image = UIImage(named: imageName)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myLabel.text = nil
        home.text = nil
        statusImage.image = nil
        lockedDoor.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageSize = contentView.frame.size.height-55
       
        myLabel.frame = CGRect(x: 75,
                               y: 5,
                               width: contentView.frame.size.width/2 ,
                               height: contentView.frame.size.height/2)
        
        statusImage.frame = CGRect(x: contentView.frame.size.width-imageSize, y: 20, width: imageSize, height: imageSize)
        
        lockedDoor.frame = CGRect(x: 25, y: 20, width: 35, height: 35)
        
        home.frame = CGRect(x: 75,
                            y: 25,
                            width: contentView.frame.size.width/2 ,
                            height: contentView.frame.size.height/2)
        
    }
    
}
