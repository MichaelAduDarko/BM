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
        var tabBarC: UITabBarController!
    
    
    
    //Mark: - Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIn()
//        signOut()
        tabBarController()
        UINavigationBar.appearance().tintColor = .white
        
        
        
        
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
    
    func tabBarController() {
        tabBarC = UITabBarController()
       
//        tabBarC.tabBar.barStyle = .blackOpaque
        UITabBar.appearance().tintColor = .systemPink
        tabBarC.viewControllers = [createCategoryNC(), createAddItemNC(), createChatNC(),
                                   createProfileNC()]
        
        
        self.view.addSubview(tabBarC.view)
     
    }
    
    func createCategoryNC() -> UINavigationController {
           let categoryVc = CategoryVc()
           categoryVc.title = "Category"
           categoryVc.tabBarItem = UITabBarItem.init(title: "Category", image: #imageLiteral(resourceName: "category"), tag: 0)
        return UINavigationController(rootViewController: categoryVc)
    }
    
    
    func createAddItemNC() -> UINavigationController {
            let addItemVc = AddItemVC()
            addItemVc.title = "AddItem"
        addItemVc.tabBarItem = UITabBarItem.init(title: "AddItem", image: #imageLiteral(resourceName: "addItem"), tag: 1)
        
        return UINavigationController(rootViewController: addItemVc)
       }
    
    func createChatNC() -> UINavigationController {
                let chatVc = ChatVC()
                 chatVc.title = "Chat"
        chatVc.tabBarItem = UITabBarItem.init(title: "Chat", image: #imageLiteral(resourceName: "chat"), tag: 2)
        return UINavigationController(rootViewController: chatVc)
    }
    
    func createProfileNC() -> UINavigationController {
            let profileVc = ProfileVc()
            profileVc.title = "Profile"
        profileVc.tabBarItem = UITabBarItem.init(title: "Profile", image: #imageLiteral(resourceName: "profile"), tag: 3)

        
        return UINavigationController(rootViewController: profileVc)
    }
    
    
}
