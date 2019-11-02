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
    var loadingDataHasEnded: (() -> Void)?
    var loadingDataHasFailed: ((Error) -> Void)?
    
    private let customerService: CustomerService
    
    init(customerService: CustomerService) {
        self.customerService = customerService
    }
    
    func loadCustomers() {
        loadingDataHasStarted?()
        customerService.customers { [weak self] in
            self?.loadingDataHasEnded?()
            self?.loadingDataHasFailed?(NSError(domain: "any-error", code: -1))
        }
    }
    
}

class CustomerService {
    typealias CustomerResult = () -> Void
    var receivedMessages: [CustomerResult] = []
    
    func customers(completion: @escaping CustomerResult) {
        receivedMessages.append(completion)
    }
    
    func completeWithError(_ error: NSError, at index: Int = 0) {
        receivedMessages[index]()
    }
    
}

class CustomerListViewModelTests: XCTestCase {

    func test_init_doesntStartLoadingData() {
        let (customerService, _) = makeSUT()
        
        XCTAssertEqual(customerService.receivedMessages.count, 0)
    }
    
    func test_loadCustomers_startLoadingData() {
        let (customerService, customerListViewModel) = makeSUT()
    
        customerListViewModel.loadCustomers()
        
        XCTAssertEqual(customerService.receivedMessages.count, 1)
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
    
    func test_loadCustomer_notifyLoadingDataHasEndedWhenResponseReceived() {
        let (customerService, customerListViewModel) = makeSUT()
        let error = NSError(domain: "any-error", code: -1)
        
        let exp = expectation(description: "Wait for loading data notification")
        customerListViewModel.loadingDataHasEnded = {
            exp.fulfill()
        }
        customerListViewModel.loadCustomers()
        customerService.completeWithError(error)
        
        wait(for: [exp], timeout: 1.0)
    }
    
    func test_loadCustomer_notifyLoadingDataHasFailedWhenAnErrorOcurred() {
        let (customerService, customerListViewModel) = makeSUT()
        let error = NSError(domain: "any-error", code: -1)
        
        let exp = expectation(description: "Wait for loading data notification")
        
        var receivedError: NSError?
        customerListViewModel.loadingDataHasFailed = { error in
            receivedError = error as NSError
            exp.fulfill()
        }
        customerListViewModel.loadCustomers()
        customerService.completeWithError(error)
        
        wait(for: [exp], timeout: 1.0)
        XCTAssertEqual(receivedError, error)
    }
    
    // MARK: - Helpers
    func makeSUT() -> (CustomerService, CustomerListViewModel) {
        let customerService = CustomerService()
        let customerListViewModel = CustomerListViewModel(customerService: customerService)
        return (customerService, customerListViewModel)
    }
    
}

