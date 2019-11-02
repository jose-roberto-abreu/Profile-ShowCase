//
//  CustomerRemoteService.swift
//  Profile ShowCase
//
//  Created by Roberto Abreu on 11/2/19.
//  Copyright © 2019 homeappzz. All rights reserved.
//

import Foundation

class CustomerRemoteService: CustomerService {
    
    func customers(completion: @escaping CustomerResult) {
        completion(.success(makeCustomers()))
    }
    
    private func makeCustomers() -> [Customer] {
        return [makeCustomer(name: "Lauren Thomas", profilePicture: "lauren_profile", isInactive: true), // Inactive
                makeCustomer(name: "Theodore Foster", profilePicture: "theodore_profile"), // Depedents
                makeCustomer(name: "Ellen Ferguson", profilePicture: "ellen_profile")] // Normal
    }
    
    private func makeCustomer(name: String, profilePicture: String, isInactive: Bool = false) -> Customer {
        return Customer(name: name, profilePicture: profilePicture, isInactive: isInactive)
    }
    
}
