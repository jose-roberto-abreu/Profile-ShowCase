//
//  CustomerHeaderViewModel.swift
//  Profile ShowCase
//
//  Created by Roberto Abreu on 11/2/19.
//  Copyright © 2019 homeappzz. All rights reserved.
//

import Foundation

class CustomerHeaderViewModel {
    
    // MARK: - Public Vars
    var profilePicture: String {
        return customer.profilePicture
    }
    
    var name: String {
        return customer.name
    }
    
    var role: String {
        return "Customer"
    }
    
    // MARK: - Private Vars
    private let customer: Customer
    
    // MARK: - Init
    init(customer: Customer) {
        self.customer = customer
    }
    
}
