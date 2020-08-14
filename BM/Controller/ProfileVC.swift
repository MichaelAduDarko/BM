//
//  ProfileVc.swift
//  BM
//
//  Created by MICHAEL ADU DARKO on 3/6/20.
//  Copyright © 2020 Bronzy. All rights reserved.

import UIKit
import Firebase

private let reuseIdentifier = "ProfileCell"

class ProfileVc: UITableViewController {
    
    //MARK:- Properties
    
    private lazy var headerview = ProfileHeaeder(frame: .init(x: 0, y: 0,
                                                width: view.frame.width,
                                                height: 380 ))
    
    
    
    //MARK:- Lifecycle
    override func viewDidLoad() {
            configurProfileVC()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    //MARK:- Selectors
    
    
    //MARK:- API
    
    //MARK:- Helpers
    func configurProfileVC(){
            view.backgroundColor = .white
           
        tableView.tableHeaderView = headerview
        headerview.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.tableFooterView = UIView()
        tableView.contentInsetAdjustmentBehavior = .never
           
       }
    
}

extension ProfileVc {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier,
                                                 for: indexPath)
        return cell
    }
}


extension ProfileVc : ProfileHeaderDelegate {
    
    func dissmissController() {
       dismiss(animated: true, completion: nil)
    }
}
