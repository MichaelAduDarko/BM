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
        self.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.layer.shadowOffset = CGSize(width: 2, height: 1)
        self.layer.shadowOpacity = 2
        self.layer.shadowRadius = 2
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        self.layer.cornerRadius = 10
        backgroundColor = #colorLiteral(red: 1, green: 0.3563321998, blue: 0.2494430361, alpha: 1)
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
            categoryIVLabel.heightAnchor.constraint(equalToConstant: 30)
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
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 21)
        label.textAlignment = .center
        
        return label
    }()
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
