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
    
    
    
    // Mark: - Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top:view.safeAreaLayoutGuide.topAnchor)
        titleLabel.centerX(inView: view)
        
        
 
    }

    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent
    }
}

