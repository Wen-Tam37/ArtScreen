//
//  MenuHeader.swift
//  ArtScreen
//
//  Created by Heng on 2020/7/15.
//  Copyright © 2020 Heng. All rights reserved.
//

import UIKit

protocol MenuHeaderDelegate: class {
    func handleMenuDismissal()
    func handleShowProfilePage()
}

class MenuHeader: UIView {
    
    //MARK: - Properties
    weak var delegate: MenuHeaderDelegate?
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "close").withRenderingMode(.alwaysOriginal), for: .normal)
        button.setDimensions(width: 24, height: 24)
        button.addTarget(self, action: #selector(handleDismissMenu), for: .touchUpInside)
        
        return button
    }()
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .white

        return iv
    }()
    
    private lazy var fullnameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.text = "翁 偉恆"
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleShowProfilePage))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tap)
        
        return label
    }()
    
    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.text = "@Heng_Weng"
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleShowProfilePage))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tap)
        
        return label
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(closeButton)
        closeButton.anchor(top: topAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 12)
        
        addSubview(profileImageView)
        profileImageView.anchor(left: leftAnchor, bottom: bottomAnchor, paddingLeft: 12, paddingBottom: 50, width: 50, height: 50)
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
    
    //MEAK: - Selectors
    @objc func handleDismissMenu() {
        delegate?.handleMenuDismissal()
    }
    
    @objc func handleShowProfilePage() {
        delegate?.handleShowProfilePage()
    }
}
