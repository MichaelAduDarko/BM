//
//  ProfileVc.swift
//  BM
//
//  Created by MICHAEL ADU DARKO on 3/6/20.
//  Copyright © 2020 Bronzy. All rights reserved.
//

import UIKit
import Firebase

class ProfileVc: UIViewController {
    
    override func viewDidLoad() {
           view.backgroundColor = .systemTeal
            configurProfileVC()
    }
    
    func configurProfileVC(){
            view.backgroundColor = .backgroundColor
           navigationController?.navigationBar.barStyle = .black
           navigationController?.navigationBar.prefersLargeTitles = true
           
       }
    
    
}
