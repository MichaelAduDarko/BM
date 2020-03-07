//
//  SignUpController.swift
//  BM
//
//  Created by MICHAEL ADU DARKO on 3/1/20.
//  Copyright © 2020 Bronzy. All rights reserved.
//

import UIKit
import Firebase

class SignUpController: UIViewController {
    
    //Mark: - Properties
    private let titleLabel: UILabel = {
           let label = UILabel()
           label.text = "Sign Up"
           label.font = UIFont(name: "Avenir-Light", size: 36)
           label.textColor = UIColor(white: 1, alpha: 0.9)
           return label
       }()
    
    
    private lazy var emailContainerView: UIView = {
         let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "email"), textField: emailTextFeild)
         view.heightAnchor.constraint(equalToConstant: 50).isActive = true
         return view
     }()
    
    
     private lazy var fullnameContainerView: UIView = {
             let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "fullname"), textField: fullnameTextFeild)
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
    
    private let fullnameTextFeild: UITextField = {
            return UITextField().textField(withPlaceholder: "Fullname", isSecureTextEntry: false)
        }()
     
     private let passwordTextFeild: UITextField = {
            return UITextField().textField(withPlaceholder: "Password", isSecureTextEntry: true)
        }()
    
        private let signUpButton: AuthButton = {
        let button = AuthButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = .systemPink
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
      
        return button
    }()
    
    let alreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Already have an account? ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
             NSMutableAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        attributedTitle.append(NSAttributedString(string: "Log In", attributes:
            [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),
             NSAttributedString.Key.foregroundColor: UIColor.mainBlueTintColor]))
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        button.setAttributedTitle(attributedTitle, for: .normal)
        
        return button
    }()
    
     
  
    //Mark: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    //Mark:- Selector
    
    @objc func handleSignUp(){
        guard let email = emailTextFeild.text else{ return }
        guard let password = passwordTextFeild.text  else { return }
        guard let fullname = fullnameTextFeild.text else {return}
       
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("DEBUG: Failed to register user with error\(error.localizedDescription)")
                return
            }
            
            guard let uid = result?.user.uid else {return}
            
            let values = ["email": email, "fullname": fullname, "password": password]
            
            
            Database.database().reference().child("users").child(uid).updateChildValues(values,
            withCompletionBlock: { (error, ref) in
                
                self.dismiss(animated: true, completion: nil)
                
            })
        }
        
    }
    
    
    
    @objc func handleShowLogin(){
        
        //Takes user back to login View after signing up
        navigationController?.popViewController(animated: true)
        
    }
    
    
    
    //Marker:- Helper Functions
     
     func configureUI(){
         view.backgroundColor = .backgroundColor
         
         view.addSubview(titleLabel)
         titleLabel.anchor(top:view.safeAreaLayoutGuide.topAnchor)
         titleLabel.centerX(inView: view)
         
         let stack = UIStackView(arrangedSubviews: [emailContainerView,fullnameContainerView,
                                                          passwordContainerView, signUpButton])
         stack.axis = .vertical
         stack.distribution = .fillEqually
         stack.spacing = 24
         
         view.addSubview(stack)
         stack.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,
                      paddingTop: 40, paddingLeft: 16, paddingRight: 16)
         
         
        view.addSubview(alreadyHaveAccountButton)
               alreadyHaveAccountButton.centerX(inView: view)
               alreadyHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, height: 32)
        
     }
    
    
}
