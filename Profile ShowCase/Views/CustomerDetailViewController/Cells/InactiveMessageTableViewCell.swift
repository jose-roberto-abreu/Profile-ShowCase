//
//  InactiveMessageTableViewCell.swift
//  Profile ShowCase
//
//  Created by Roberto Abreu on 11/2/19.
//  Copyright © 2019 homeappzz. All rights reserved.
//

import UIKit

class InactiveMessageTableViewCell: UITableViewCell {
    
    // MARK: - Public Vars
    
    // MARK: - Private Vars
    private let titleLabel = UILabel.autoLayout()
    private let bodyLabel = UILabel.autoLayout()
    
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
extension InactiveMessageTableViewCell {
    
    func setupViews() {
        selectionStyle = .none
        separatorInset.right = .greatestFiniteMagnitude
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 19.0)
        titleLabel.textAlignment = .center
        
        bodyLabel.font = .boldSystemFont(ofSize: 17.0)
        bodyLabel.textColor = .lightGray
        bodyLabel.textAlignment = .center
        bodyLabel.numberOfLines = 0
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(bodyLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100.0),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18.0),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18.0)
        ])
        
        NSLayoutConstraint.activate([
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3.0),
            bodyLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            bodyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
            bodyLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0)
        ])
    }
    
}

// MARK: - TableViewBinder
extension InactiveMessageTableViewCell: TableViewBinder {
    
    func bind(row: RowViewModel) {
        guard let row = row as? InactiveMessageRowViewModel else {
            preconditionFailure("Expected row to be of type `InactiveMessageRowViewModel`")
        }
        
        titleLabel.text = row.title
        bodyLabel.text = row.message
    }
    
}
