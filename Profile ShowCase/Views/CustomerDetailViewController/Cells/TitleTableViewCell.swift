//
//  TitleTableViewCell.swift
//  Profile ShowCase
//
//  Created by Roberto Abreu on 11/2/19.
//  Copyright © 2019 homeappzz. All rights reserved.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    
    // MARK: - Public Vars
    
    // MARK: - Private Vars
    private let titleLabel = UILabel.autoLayout()
    
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
extension TitleTableViewCell {
    
    func setupViews() {
        selectionStyle = .none
        separatorInset.right = .greatestFiniteMagnitude
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        
        contentView.addSubview(titleLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24.0),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8.0),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18.0),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18.0)
        ])
    }
    
}

// MARK: - UITableViewBinder
extension TitleTableViewCell: TableViewBinder {
    
    func bind(row: RowViewModel) {
        guard let row = row as? TitleRowViewModel else {
            preconditionFailure("row expected to be of type `TitleRowViewModel`")
        }
        
        titleLabel.text = row.title
    }
    
}
