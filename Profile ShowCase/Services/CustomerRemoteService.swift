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
        let customers = [makeCustomer(name: "José Abreu", profilePicture: "", isInactive: true), // Inactive
                         makeCustomer(name: "José Abreu", profilePicture: ""), // Depedents
                         makeCustomer(name: "José Abreu", profilePicture: "")] // Normal
        completion(.success(customers))
    }
    
    private func makeCustomer(name: String, profilePicture: String, isInactive: Bool = false) -> Customer {
        return Customer(name: name, profilePicture: profilePicture, isInactive: isInactive)
    }
    
}
