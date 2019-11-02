//
//  CustomerListViewController.swift
//  Profile ShowCase
//
//  Created by Roberto Abreu on 11/2/19.
//  Copyright © 2019 homeappzz. All rights reserved.
//

import UIKit

class CustomerListViewController: UIViewController {
    
    // MARK: - Public Vars
    
    // MARK: - Private Vars
    private let tableView = UITableView.autoLayout()
    private let loadingView = UIActivityIndicatorView.autoLayout()
    
    private let viewModel: CustomerListViewModel
    
    // MARK: - Init
    init(viewModel: CustomerListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        setupViews()
        setupConstraints()
    }
    
}

// MARK: - Setup ViewModels
extension CustomerListViewController {
    
    func bindViewModel() {
        viewModel.loadingDataHasStarted = { [weak self] in
            self?.loadingView.startAnimating()
        }
        
        viewModel.loadingDataHasEnded = { [weak self] in
            self?.loadingView.stopAnimating()
        }
        
        viewModel.loadingDataHasFailed = { _ in
            
        }
        
        viewModel.reload = { [weak self] in
            self?.tableView.reloadData()
        }
        
        viewModel.loadCustomers()
    }
    
}

// MARK: - Setup Views
extension CustomerListViewController {
    
    func setupViews() {
        title = "Customers"
        
        loadingView.hidesWhenStopped = true
        loadingView.style = UIActivityIndicatorView.Style.medium
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        
        view.addSubview(tableView)
        view.addSubview(loadingView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}

// MARK: - UITableViewDataSource
extension CustomerListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCustomers()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}

// MARK: - UITableViewDelegate
extension CustomerListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
