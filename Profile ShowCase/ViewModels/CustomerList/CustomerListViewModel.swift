//
//  CustomerListViewModel.swift
//  Profile ShowCase
//
//  Created by Roberto Abreu on 11/2/19.
//  Copyright © 2019 homeappzz. All rights reserved.
//

import Foundation

class CustomerListViewModel {
    
    // MARK: - Public Vars
    var loadingDataHasStarted: (() -> Void)?
    var loadingDataHasEnded: (() -> Void)?
    var loadingDataHasFailed: ((Error) -> Void)?
    var reload: (() -> Void)?
    
    // MARK: - Private Vars
    private var customers: [Customer] = []
    private let customerService: CustomerService
    
    // MARK: - Init
    init(customerService: CustomerService) {
        self.customerService = customerService
    }
    
}

// MARK: - Support Methods
extension CustomerListViewModel {
    
    func numberOfCustomers() -> Int {
        return customers.count
    }
    
    func makeCustomerTableViewCellViewModel(at index: Int) -> CustomerTableViewCellViewModel {
        let customer = customers[index]
        return CustomerTableViewCellViewModel(customer: customer)
    }
    
}

// MARK: - Services
extension CustomerListViewModel {
    
    func loadCustomers() {
        loadingDataHasStarted?()
        customerService.customers { [weak self] response in
            self?.loadingDataHasEnded?()
            switch response {
            case .failure(let error):
                self?.loadingDataHasFailed?(error)
            case .success(let customers):
                self?.customers = customers
            }
            self?.reload?()
        }
    }
    
}
