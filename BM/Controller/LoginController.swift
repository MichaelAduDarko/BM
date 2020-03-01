//
//  LoginController.swift
//  BM
//
//  Created by MICHAEL ADU DARKO on 2/29/20.
//  Copyright © 2020 Bronzy. All rights reserved.
//


import UIKit

class LoginController: UIViewController {

    // Mark: - Properties
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Black Market"
        label.font = UIFont(name: "Avenir-Light", size: 36)
        label.textColor = UIColor(white: 1, alpha: 0.9)
        return label
    }()
    
    private lazy var emailContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "email"), textField: emailTextFeild)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private lazy var passwordContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "password"), textField: passwordTextFeild)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
       }()
    
    private let emailTextFeild: UITextField = {
        return UITextField().textField(withPlaceholder: "Email", isSecureTextEntry: false)
    }()
    
    private let passwordTextFeild: UITextField = {
           return UITextField().textField(withPlaceholder: "Password", isSecureTextEntry: true)
       }()
    
    
    // Mark: - Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top:view.safeAreaLayoutGuide.topAnchor)
        titleLabel.centerX(inView: view)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 16
        
        view.addSubview(stack)
        stack.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,
                     paddingTop: 40, paddingLeft: 16, paddingRight: 16)
        
        
 
    }

    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent
    }
}

