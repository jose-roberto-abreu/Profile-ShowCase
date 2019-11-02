//
//  PersonalInformationTableViewCell.swift
//  Profile ShowCase
//
//  Created by Roberto Abreu on 11/2/19.
//  Copyright © 2019 homeappzz. All rights reserved.
//

import UIKit

class PersonalInformationTableViewCell: UITableViewCell {
    
    // MARK: - Public Vars
    
    // MARK: - Private Vars
    private let stackContainerView = UIStackView.autoLayout()
    private let titleLabel = UILabel.autoLayout()
    private let valueLabel = UILabel.autoLayout()
    
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

extension PersonalInformationTableViewCell {
    
    func setupViews() {
        selectionStyle = .none
        separatorInset.right = .greatestFiniteMagnitude
        
        titleLabel.font = UIFont.systemFont(ofSize: 17.0)
        titleLabel.textAlignment = .left
        titleLabel.textColor = .lightGray
        
        valueLabel.font = UIFont.systemFont(ofSize: 17.0)
        valueLabel.textAlignment = .right
        valueLabel.textColor = .lightGray
        valueLabel.numberOfLines = 0
        
        stackContainerView.distribution = .fillEqually
        stackContainerView.addArrangedSubview(titleLabel)
        stackContainerView.addArrangedSubview(valueLabel)
        
        contentView.addSubview(stackContainerView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackContainerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2.5),
            stackContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2.5),
            stackContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18.0),
            stackContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18.0)
        ])
    }
    
}

// MARK: - UITableViewBinder
extension PersonalInformationTableViewCell: TableViewBinder {
    
    func bind(row: RowViewModel) {
        guard let row = row as? PersonalInformationRowViewModel else {
            preconditionFailure("row expected to be of type `PersonalInformationRowViewModel`")
        }
        
        titleLabel.text = row.title
        valueLabel.text = row.value
    }
    
}
