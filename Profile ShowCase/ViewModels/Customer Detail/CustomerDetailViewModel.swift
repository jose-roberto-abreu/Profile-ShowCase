//
//  CustomerDetailViewModel.swift
//  Profile ShowCase
//
//  Created by Roberto Abreu on 11/2/19.
//  Copyright © 2019 homeappzz. All rights reserved.
//

import Foundation

class CustomerDetailViewModel {
    
    // MARK: - Public Vars
    
    // MARK: - Private Vars
    private let customer: Customer
    
    // MARK: - Init
    init(customer: Customer) {
        self.customer = customer
    }
    
}

// MARK: - Support Methods
extension CustomerDetailViewModel {
    
    func makeCustomerHeaderViewModel() -> CustomerHeaderViewModel {
        return CustomerHeaderViewModel(customer: customer)
    }
    
}
