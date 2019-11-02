//
//  CustomerTableViewCellModel.swift
//  Profile ShowCase
//
//  Created by Roberto Abreu on 11/2/19.
//  Copyright © 2019 homeappzz. All rights reserved.
//

import Foundation

class CustomerTableViewCellViewModel {
    
    // MARK: - Public Vars
    var profilePicture: String {
        return customer.profilePicture
    }
    
    var name: String {
        return customer.name
    }
    
    var status: String {
        return customer.isInactive ? "Inactive" : "Active"
    }
    
    // MARK: - Private Vars
    private let customer: Customer
    
    // MARK: - Init
    init(customer: Customer) {
        self.customer = customer
    }
    
}
