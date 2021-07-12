//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Антон Кангин on 29.06.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText: String = ""
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var butonShowStatus: UIButton!
    @IBOutlet weak var statusTextField: UITextField!
    
    @IBAction func buttonStatusPressed(_ sender: UIButton) {
        guard !statusText.isEmpty else { return }
        statusLabel.text = statusText
    }
    
    @IBAction func textFieldEdited(_ sender: UITextField) {
        if let newStatus = sender.text {
            statusText = newStatus
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setUpView()
    }
    
    private func setUpView() {
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.borderWidth = 3
        
        titleLabel.sizeToFit()
        
        statusLabel.textColor = .gray
        
        butonShowStatus.layer.cornerRadius = 12
        butonShowStatus.layer.shadowOffset = CGSize(width: 4, height: 4)
        butonShowStatus.layer.shadowRadius = 4
        butonShowStatus.layer.shadowColor = UIColor.black.cgColor
        butonShowStatus.layer.shadowOpacity = 0.7
        
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.backgroundColor = UIColor.white.cgColor
    }
}
