//
//  InboxVC.swift
//  BM
//
//  Created by MICHAEL ADU DARKO on 3/6/20.
//  Copyright © 2020 Bronzy. All rights reserved.
//

import UIKit
import Firebase

class ChatVC: UIViewController {
    
    override func viewDidLoad() {
           view.backgroundColor = .systemBlue
            configureChatVC()
    }
    
    func configureChatVC(){
         view.backgroundColor = .backgroundColor
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
}

