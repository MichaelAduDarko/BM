//
//  AuthButton.swift
//  BM
//
//  Created by MICHAEL ADU DARKO on 3/1/20.
//  Copyright © 2020 Bronzy. All rights reserved.
//

import UIKit

class AuthButton: UIButton {
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
       setTitleColor(UIColor(white: 1, alpha: 0.5), for: .normal)
       layer.cornerRadius = 5
       heightAnchor.constraint(equalToConstant: 50).isActive = true
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
