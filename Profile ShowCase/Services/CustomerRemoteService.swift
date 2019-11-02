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
        let customers = [Customer(), Customer(), Customer()]
        completion(.success(customers))
    }
    
}
