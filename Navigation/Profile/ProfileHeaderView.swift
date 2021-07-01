//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Антон Кангин on 29.06.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "avatar")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let butonShowStatus: UIButton = {
        let buttonStatus = UIButton()
        buttonStatus.setTitle("Show status", for: .normal)
        buttonStatus.backgroundColor = .systemBlue
        buttonStatus.setTitleColor(.white, for: .normal)
        buttonStatus.addTarget(self, action: #selector(buttonStatusPressed), for: .touchUpInside)
        return buttonStatus
    }()
    
    private let titleLabel: UILabel = {
       let titleLabel = UILabel()
        titleLabel.text = "Anton Kangin"
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 1
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    private let statusLabel: UILabel = {
       let statusLabel = UILabel()
        statusLabel.text = "Waiting for something..."
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = .gray
        statusLabel.numberOfLines = 1
        statusLabel.textAlignment = .left
        return statusLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(avatarImageView)
        addSubview(butonShowStatus)
        addSubview(titleLabel)
        addSubview(statusLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setUpView()
    }
    
    @objc private func buttonStatusPressed() {
        print(statusLabel.text ?? "")
    }
    
    private func setUpView() {
        
        let margin: CGFloat = 16
        let topMarginLabel: CGFloat = 27
        let marginButtonLabel: CGFloat = 34
        
        let imageSize: CGFloat = 100
        
        let buttonFrameY: CGFloat = self.safeAreaInsets.top + avatarImageView.frame.height + 2 * margin
        let buttonHeigth: CGFloat = 50
        
        avatarImageView.frame = CGRect(x: margin,
                                       y: self.safeAreaInsets.top + margin,
                                       width: imageSize,
                                       height: imageSize)
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.borderWidth = 3
        
        titleLabel.sizeToFit()
        titleLabel.frame = CGRect(x: (self.frame.width - titleLabel.frame.width) / 2,
                                  y: self.safeAreaInsets.top + topMarginLabel,
                                  width: titleLabel.frame.width,
                                  height: titleLabel.frame.height)
        
        statusLabel.sizeToFit()
        statusLabel.frame = CGRect(x: margin * 2 + imageSize,
                                   y: buttonFrameY - marginButtonLabel - statusLabel.frame.height,
                                  width: statusLabel.frame.width,
                                  height: statusLabel.frame.height)
        
        butonShowStatus.frame = CGRect(x: margin,
                                       y: buttonFrameY,
                                       width: self.frame.width - margin * 2,
                                       height: buttonHeigth)
        butonShowStatus.layer.cornerRadius = 4
        butonShowStatus.layer.shadowOffset = CGSize(width: 4, height: 4)
        butonShowStatus.layer.shadowRadius = 4
        butonShowStatus.layer.shadowColor = UIColor.black.cgColor
        butonShowStatus.layer.shadowOpacity = 0.7
    }
}
