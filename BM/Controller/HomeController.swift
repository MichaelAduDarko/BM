//
//  HomeController.swift
//  BM
//
//  Created by MICHAEL ADU DARKO on 3/6/20.
//  Copyright © 2020 Bronzy. All rights reserved.
//

import UIKit
import Firebase

class HomeController: UIViewController {
    
    //Mark:- Properties
    
    //Mark: - Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIn()
        view.backgroundColor = .red
//        signOut()
        
        
    }
    
    //Mark: - API
    
    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser?.uid == nil {
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: LoginController())
                nav.modalPresentationStyle = .fullScreen
                 self.present(nav, animated: true, completion: nil)
            }
        }else {
           
            print("DEBUG: User id is \(String(describing: Auth.auth().currentUser?.uid))...")
        }
    }
    
    func signOut(){
        do {
            try Auth.auth().signOut()
        }catch {
            print("DEBUG: Error  signing out")
        }
    }
}
