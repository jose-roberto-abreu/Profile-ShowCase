//
//  CustomerTableViewCell.swift
//  Profile ShowCase
//
//  Created by Roberto Abreu on 11/2/19.
//  Copyright © 2019 homeappzz. All rights reserved.
//

import UIKit

class CustomerTableViewCell: UITableViewCell {
    
    // MARK: - Public Vars
    var viewModel: CustomerTableViewCellViewModel? {
        didSet {
            profileImageView.image = UIImage(named: viewModel?.profilePicture ?? "")
            nameLabel.text = viewModel?.name
            statusLabel.text = viewModel?.status
        }
    }
    
    // MARK: - Private Vars
    private let profileImageView = UIImageView.autoLayout()
    private let stackContainer = UIStackView.autoLayout()
    private let nameLabel = UILabel.autoLayout()
    private let statusLabel = UILabel.autoLayout()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
extension CustomerTableViewCell {
    
    func setupViews() {
        accessoryType = .disclosureIndicator
        
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = 25.0
        profileImageView.layer.masksToBounds = true
        
        nameLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        
        statusLabel.font = UIFont.systemFont(ofSize: 15.0)
        statusLabel.textColor = .lightGray
        
        stackContainer.axis = .vertical
        stackContainer.addArrangedSubview(nameLabel)
        stackContainer.addArrangedSubview(statusLabel)
        
        contentView.addSubview(profileImageView)
        contentView.addSubview(stackContainer)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            profileImageView.widthAnchor.constraint(equalToConstant: 50.0),
            profileImageView.heightAnchor.constraint(equalToConstant: 50.0),
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12.0),
            profileImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16.0),
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18.0)
        ])
        
        NSLayoutConstraint.activate([
            stackContainer.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            stackContainer.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 12.0),
            stackContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
}
