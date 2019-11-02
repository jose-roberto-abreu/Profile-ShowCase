//
//  CustomerListViewModelTests.swift
//  Profile ShowCaseTests
//
//  Created by Roberto Abreu on 11/2/19.
//  Copyright © 2019 homeappzz. All rights reserved.
//

import XCTest

class CustomerListViewModel {
    
    private let customerService: CustomerService
    
    init(customerService: CustomerService) {
        self.customerService = customerService
    }
    
    func loadCustomers() {
        customerService.customers()
    }
    
}

class CustomerService {
    var receivedMessageCount: Int = 0
    
    func customers() {
        receivedMessageCount += 1
    }
}

class CustomerListViewModelTests: XCTestCase {

    func test_init_doesntStartLoadingData() {
        let customerService = CustomerService()
        let _ = CustomerListViewModel(customerService: customerService)
        
        XCTAssertEqual(customerService.receivedMessageCount, 0)
    }
    
    func test_loadCustomers_startLoadingData() {
        let customerService = CustomerService()
        let customerListViewModel = CustomerListViewModel(customerService: customerService)
    
        customerListViewModel.loadCustomers()
        
        XCTAssertEqual(customerService.receivedMessageCount, 1)
    }
    
}

