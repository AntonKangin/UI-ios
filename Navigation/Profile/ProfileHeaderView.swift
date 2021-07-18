//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Антон Кангин on 29.06.2021.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText: String = ""
    
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
        titleLabel.textAlignment = .left
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
    
    private let statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.textColor = .black
        statusTextField.textAlignment = .center
        statusTextField.placeholder = "Inter your status"
        statusTextField.backgroundColor = .white
        statusTextField.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)
        return statusTextField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(avatarImageView)
        addSubview(butonShowStatus)
        addSubview(titleLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setUpView()
    }
    
    @objc private func buttonStatusPressed() {
        guard !statusText.isEmpty else {
            
            return
        }
        statusLabel.text = statusText
    }
    
    @objc private func textFieldEdited() {
        if let newStatus = statusTextField.text {
            statusText = newStatus
        }
    }
    
    private func setUpView() {
        
        let imageBottom: CGFloat = self.safeAreaInsets.top + avatarImageView.frame.height + Constants.leadingTopAnchor
        
        avatarImageView.frame = CGRect(x: Constants.leadingTopAnchor,
                                       y: self.safeAreaInsets.top + Constants.leadingTopAnchor,
                                       width: Constants.logoSize,
                                       height: Constants.logoSize)
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.borderWidth = 3
        
        titleLabel.sizeToFit()
        titleLabel.frame = CGRect(x: (self.frame.width - titleLabel.frame.width) / 2,
                                  y: self.safeAreaInsets.top + Constants.topMargin,
                                  width: titleLabel.frame.width,
                                  height: titleLabel.frame.height)
        
        statusLabel.sizeToFit()
        statusLabel.frame = CGRect(x: Constants.leadingTopAnchor * 2 + Constants.logoSize,
                                   y: imageBottom - Constants.leadingTopAnchor - statusLabel.frame.height,
                                   width: statusLabel.frame.width,
                                   height: statusLabel.frame.height)
        
        butonShowStatus.frame = CGRect(x: Constants.leadingTopAnchor,
                                       y: imageBottom + 2 * Constants.leadingTopAnchor,
                                       width: self.frame.width - Constants.leadingTopAnchor * 2,
                                       height: Constants.heightValue)
        butonShowStatus.layer.cornerRadius = 12
        butonShowStatus.layer.shadowOffset = CGSize(width: 4, height: 4)
        butonShowStatus.layer.shadowRadius = 4
        butonShowStatus.layer.shadowColor = UIColor.black.cgColor
        butonShowStatus.layer.shadowOpacity = 0.7
        
        statusTextField.sizeToFit()
        statusTextField.frame = CGRect(x: Constants.leadingTopAnchor * 2 + Constants.logoSize,
                                       y: imageBottom - Constants.leadingTopAnchor,
                                       width: self.frame.width - Constants.logoSize - 3 * Constants.leadingTopAnchor,
                                       height: Constants.statusTextFieldHeight)
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
    }
}
