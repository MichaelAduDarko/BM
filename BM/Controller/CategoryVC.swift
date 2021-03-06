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
    
    lazy var data: [categoryData] = ExampleData.data
    
    //Mark:- Properties
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CategoryCell.self, forCellWithReuseIdentifier: "cell")
        
        return cv
    }()
    
    override func viewDidLoad() {
//        configureUI()
      
        view.addSubview(collectionView)
       
        
        collectionView.backgroundColor = #colorLiteral(red: 0.8802615509, green: 0.8898189983, blue: 0.9010152284, alpha: 0.9514126712)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "cell")
    }
    
 
    
    //MARK:- Selectors

    
    
    //MARK:- Helpers
    
    
    
    
    
}

extension CategoryVc: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width / 2) - 20
        return CGSize(width: width, height: width)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let categoryDetail = DetailViewController()
        self.navigationController?.pushViewController(categoryDetail, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CategoryCell
        cell.data = data[indexPath.item]
        return cell
    }
}



struct ExampleData {
    static let data = [categoryData(image: #imageLiteral(resourceName: "Computer"), name: "Computers"),
                       categoryData(image: #imageLiteral(resourceName: "Motorcycles"), name: "Motorcycles"),
                       categoryData(image: #imageLiteral(resourceName: "Bicycles"), name: "Bicycles"),
                       categoryData(image: #imageLiteral(resourceName: "Cars"), name: "Cars"),
                       categoryData(image: #imageLiteral(resourceName: "Videogames"), name: "Video Games"),
                       categoryData(image: #imageLiteral(resourceName: "Books"), name: "Books"),
                       categoryData(image: #imageLiteral(resourceName: "sports"), name: "Sports"),
                       categoryData(image: #imageLiteral(resourceName: "TVs"), name: "TV"),
                       categoryData(image: #imageLiteral(resourceName: "Autoparts"), name: "Auto Part"),
                       categoryData(image: #imageLiteral(resourceName: "Cars"), name: "Books")]
}


