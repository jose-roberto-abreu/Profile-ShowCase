//
//  CustomerDetailViewController.swift
//  Profile ShowCase
//
//  Created by Roberto Abreu on 11/2/19.
//  Copyright © 2019 homeappzz. All rights reserved.
//

import UIKit

class CustomerDetailViewController: UIViewController {
    
    // MARK: - Public Vars
    
    // MARK: - Private Vars
    private let tableView = UITableView.autoLayout()
    
    private lazy var customerHeaderView: CustomerHeaderView = {
        return CustomerHeaderView(frame: CGRect(x: 0, y: 0, width: 0, height: 320.0))
    }()
    
    private let viewModel: CustomerDetailViewModel
    
    // MARK: - Init
    init(viewModel: CustomerDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
}

// MARK: - Setup Views
extension CustomerDetailViewController {
    
    func setupViews() {
        title = "Profile"
        
        customerHeaderView.viewModel = viewModel.makeCustomerHeaderViewModel()
        
        tableView.tableHeaderView = customerHeaderView
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
}

// MARK: - UITableViewDataSource
extension CustomerDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
