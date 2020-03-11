//
//  CategoryCell.swift
//  BM
//
//  Created by MICHAEL ADU DARKO on 3/7/20.
//  Copyright © 2020 Bronzy. All rights reserved.
//

import UIKit

struct categoryData {
    let image: UIImage
    let name : String?
}

class CategoryCell: UICollectionViewCell {
    
    //Mark: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        setCellShadow()
    }
    
    
    func setCellShadow(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 1
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        self.layer.cornerRadius = 10
        backgroundColor = .red
    }
    
    func setUp(){
        let imageHeight: CGFloat = contentView.bounds.size.height - 25
        let imageWidth: CGFloat = contentView.bounds.size.width
        self.backgroundColor = .black
        contentView.addSubview(categoryIVLabel)
        contentView.addSubview(categoryIV)
        
        NSLayoutConstraint.activate([
            categoryIVLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            categoryIVLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            categoryIVLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            categoryIVLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            categoryIV.topAnchor.constraint(equalTo: topAnchor),
            categoryIV.bottomAnchor.constraint(equalTo: categoryIVLabel.topAnchor),
            categoryIV.heightAnchor.constraint(equalToConstant: imageHeight),
            categoryIV.widthAnchor.constraint(equalToConstant: imageWidth)
//            categoryIV.leftAnchor.constraint(equalTo: leftAnchor),
//            categoryIV.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
    
    
    var data: categoryData? {
        didSet {
            guard  let data = data else {return}
            categoryIV.image = data.image
            categoryIVLabel.text = data.name
        }
    }
    
    
    let categoryIV : UIImageView = {
        let iv = UIImageView()
//        iv.image = #imageLiteral(resourceName: "Motorcycles")
//        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
        
    }()
    
    let categoryIVLabel : UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 21)
        label.textAlignment = .center
        
        return label
    }()
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
