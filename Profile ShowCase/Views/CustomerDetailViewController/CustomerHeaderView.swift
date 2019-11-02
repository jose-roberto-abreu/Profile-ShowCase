//
//  CustomerHeaderView.swift
//  Profile ShowCase
//
//  Created by Roberto Abreu on 11/2/19.
//  Copyright © 2019 homeappzz. All rights reserved.
//

import UIKit

class CustomerHeaderView: UIView {
    
    // MARK: - Public Vars
    var viewModel: CustomerHeaderViewModel? {
        didSet {
            profileImageView.image = UIImage(named: viewModel?.profilePicture ?? "")
            nameLabel.text = viewModel?.name
            roleLabel.text = viewModel?.role
        }
    }
    
    // MARK: - Private Vars
    private let profileImageView = UIImageView.autoLayout()
    private let nameLabel = UILabel.autoLayout()
    private let roleLabel = UILabel.autoLayout()
    private let bottomGradient = UIImageView.autoLayout()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        setupViews()
        setupConstraints()
    }
    
}

// MARK: - Setup Views
extension CustomerHeaderView {
    
    func setupViews() {
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.clipsToBounds = true
        
        bottomGradient.image = UIImage(named: "bottom_gradient")
        
        nameLabel.font = .boldSystemFont(ofSize: 19.0)
        nameLabel.textColor = .white
        
        roleLabel.font = .systemFont(ofSize: 17.0)
        roleLabel.textColor = .white
        
        addSubview(profileImageView)
        addSubview(bottomGradient)
        addSubview(nameLabel)
        addSubview(roleLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: topAnchor),
            profileImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            bottomGradient.heightAnchor.constraint(equalToConstant: 100.0),
            bottomGradient.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomGradient.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomGradient.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.bottomAnchor.constraint(equalTo: roleLabel.topAnchor, constant: -5.0),
            nameLabel.leadingAnchor.constraint(equalTo: roleLabel.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: roleLabel.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            roleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16.0),
            roleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18.0),
            roleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18.0)
        ])
    }
    
}
