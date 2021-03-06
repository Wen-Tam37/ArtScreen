//
//  UserCoverView.swift
//  ArtScreen
//
//  Created by Heng on 2020/7/16.
//  Copyright © 2020 Heng. All rights reserved.
//

import UIKit

class UserCoverView: UIView {
    
    //MARK: - Properties
    private let coverImageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.image = #imageLiteral(resourceName: "coverImage")
    
        return iv
    }()
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .white
        iv.setDimensions(width: 52, height: 52)
        
        return iv
    }()
    
    private let fullnameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.text = "翁 偉恆"
        
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.text = "@Heng_Weng"
        
        return label
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.numberOfLines = 0
        label.text = "#Graphic Designer #Calligraphy #Programer #iOS #Swift"
        
        return label
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(coverImageView)
        coverImageView.addConstraintsToFillView(self)
        
        addSubview(bioLabel)
        bioLabel.anchor(left: leftAnchor, bottom: bottomAnchor, paddingLeft: 12, paddingBottom: 16, width: 150)
        
        addSubview(profileImageView)
        profileImageView.anchor(left: leftAnchor, bottom: bioLabel.topAnchor, paddingLeft: 12, paddingBottom: 16, width: 50, height: 50)
        profileImageView.layer.cornerRadius = 50 / 2
        
        let stack = UIStackView(arrangedSubviews: [fullnameLabel, usernameLabel])
        stack.distribution = .fillEqually
        stack.spacing = 4
        stack.axis = .vertical
        
        addSubview(stack)
        stack.centerY(inView: profileImageView, leftAnchor: profileImageView.rightAnchor, paddingLeft: 12)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
