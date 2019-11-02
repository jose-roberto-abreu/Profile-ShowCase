//
//  CustomerListViewModelTests.swift
//  Profile ShowCaseTests
//
//  Created by Roberto Abreu on 11/2/19.
//  Copyright © 2019 homeappzz. All rights reserved.
//

import XCTest

class CustomerListViewModel {
    
    var loadingDataHasStarted: (() -> Void)?
    
    private let customerService: CustomerService
    
    init(customerService: CustomerService) {
        self.customerService = customerService
    }
    
    func loadCustomers() {
        loadingDataHasStarted?()
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
        let (customerService, _) = makeSUT()
        
        XCTAssertEqual(customerService.receivedMessageCount, 0)
    }
    
    func test_loadCustomers_startLoadingData() {
        let (customerService, customerListViewModel) = makeSUT()
    
        customerListViewModel.loadCustomers()
        
        XCTAssertEqual(customerService.receivedMessageCount, 1)
    }
    
    func test_loadCustomer_notifyLoadingDataHasStarted() {
        let (_, customerListViewModel) = makeSUT()
        
        let exp = expectation(description: "Wait for loading data notification")
        customerListViewModel.loadingDataHasStarted = {
            exp.fulfill()
        }
        customerListViewModel.loadCustomers()
        
        wait(for: [exp], timeout: 1.0)
    }
    
    // MARK: - Helpers
    func makeSUT() -> (CustomerService, CustomerListViewModel) {
        let customerService = CustomerService()
        let customerListViewModel = CustomerListViewModel(customerService: customerService)
        return (customerService, customerListViewModel)
    }
    
}

