//
//  LogInViewController.swift
//  Navigation
//
//  Created by Антон Кангин on 12.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let containerView = UIView()
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print(type(of: self), #function)
    }
    
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        emailTextField.textColor = .black
        emailTextField.placeholder = Strings.emailOrPhone
        emailTextField.backgroundColor = .systemGray6
        emailTextField.autocorrectionType = .no
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        return emailTextField
    }()
    
    private let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        passwordTextField.textColor = .black
        passwordTextField.placeholder = Strings.password
        passwordTextField.backgroundColor = .systemGray6
        passwordTextField.autocorrectionType = .no
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.isSecureTextEntry = true
        return passwordTextField
    }()
    
    private let buttonLogIn: UIButton = {
        let buttonLogIn = UIButton()
        buttonLogIn.setTitle(Strings.logIn, for: .normal)
        buttonLogIn.setTitleColor(.white, for: .normal)
        buttonLogIn.translatesAutoresizingMaskIntoConstraints = false
        buttonLogIn.addTarget(self, action: #selector(buttonLogInPressed), for: .touchUpInside)
        return buttonLogIn
    }()
    
    
    @objc private func buttonLogInPressed() {
        let storyboardInstance = UIStoryboard(name: "Main", bundle: nil)
        let profileViewController = storyboardInstance.instantiateViewController(withIdentifier: "profileViewController")
        self.navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {

            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    
    @objc func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
    }
    
    
    private func setUpViews() {
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(logoImageView)
        containerView.addSubview(emailTextField)
        containerView.addSubview(passwordTextField)
        containerView.addSubview(buttonLogIn)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.keyboardDismissMode = .onDrag
        
        let constraints = [
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constants.topAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: Constants.logoSize),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor),
            logoImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: Constants.topAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constants.leadingTopAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: Constants.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: Constants.heightValue),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constants.leadingTopAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: Constants.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: Constants.heightValue),
            
            buttonLogIn.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: Constants.leadingTopAnchor),
            buttonLogIn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constants.leadingTopAnchor),
            buttonLogIn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: Constants.trailingAnchor),
            buttonLogIn.heightAnchor.constraint(equalToConstant: Constants.heightValue),
            buttonLogIn.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: Constants.leadingTopAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        emailTextField.layer.borderWidth = 0.5
        emailTextField.layer.cornerRadius = 10
        emailTextField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        emailTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: Constants.leadingTopAnchor, height: emailTextField.frame.height))
        emailTextField.leftViewMode = .always
        
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: Constants.leadingTopAnchor, height: passwordTextField.frame.height))
        passwordTextField.leftViewMode = .always
        
        buttonLogIn.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        buttonLogIn.layer.cornerRadius = 10
        buttonLogIn.layer.masksToBounds = true
    }
    
}
