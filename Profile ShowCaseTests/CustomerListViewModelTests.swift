//
//  CustomerListViewModelTests.swift
//  Profile ShowCaseTests
//
//  Created by Roberto Abreu on 11/2/19.
//  Copyright © 2019 homeappzz. All rights reserved.
//

import XCTest
@testable import Profile_ShowCase

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
    
    func test_loadCustomer_receivedDataWhenSucceded() {
        let (customerService, customerListViewModel) = makeSUT()
        let customers = [makeCustomer(), makeCustomer(), makeCustomer()]
        
        customerListViewModel.loadCustomers()
        customerService.completeSucceed(with: customers)
        
        XCTAssertEqual(customerListViewModel.numberOfCustomers(), 3)
    }
    
    func test_loadCustomer_notifyToReloadWhenErrorReceived() {
        let (customerService, customerListViewModel) = makeSUT()
        let error = NSError(domain: "any-error", code: -1)
    
        let exp = expectation(description: "Wait for loading data notification")
        customerListViewModel.reload = {
            exp.fulfill()
        }
        customerListViewModel.loadCustomers()
        customerService.completeWithError(error)
        
        wait(for: [exp], timeout: 1.0)
    }
    
    func test_loadCustomer_notifyToReloadWhenSucceded() {
        let (customerService, customerListViewModel) = makeSUT()
        let customers = [makeCustomer(), makeCustomer(), makeCustomer()]
        
        let exp = expectation(description: "Wait for loading data notification")
        customerListViewModel.reload = {
            exp.fulfill()
        }
        customerListViewModel.loadCustomers()
        customerService.completeSucceed(with: customers)
        
        wait(for: [exp], timeout: 1.0)
    }
    
    // MARK: - Helpers
    private func makeSUT() -> (CustomerServiceSpy, CustomerListViewModel) {
        let customerService = CustomerServiceSpy()
        let customerListViewModel = CustomerListViewModel(customerService: customerService)
        return (customerService, customerListViewModel)
    }
    
    private func makeCustomer() -> Customer {
        return Customer()
    }
    
    private class CustomerServiceSpy: CustomerService {
        var receivedMessages: [CustomerResult] = []
        
        func customers(completion: @escaping CustomerResult) {
            receivedMessages.append(completion)
        }
        
        func completeWithError(_ error: NSError, at index: Int = 0) {
            receivedMessages[index](.failure(error))
        }
        
        func completeSucceed(with customers: [Customer], at index: Int = 0) {
            receivedMessages[index](.success(customers))
        }
    }
    
}

