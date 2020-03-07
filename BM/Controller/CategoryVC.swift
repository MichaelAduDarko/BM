//
//  CategoryVC.swift
//  BM
//
//  Created by MICHAEL ADU DARKO on 3/6/20.
//  Copyright © 2020 Bronzy. All rights reserved.
//

import UIKit
import Firebase

class CategoryVc: UIViewController {
    
    override func viewDidLoad() {
        configureCategoryVC()
       
    }
    
    func configureCategoryVC(){
         view.backgroundColor = .backgroundColor
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
   
}
