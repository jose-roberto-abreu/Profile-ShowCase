//
//  CustomerListViewModelTests.swift
//  Profile ShowCaseTests
//
//  Created by Roberto Abreu on 11/2/19.
//  Copyright © 2019 homeappzz. All rights reserved.
//

import XCTest

class CustomerListViewModel {
    
    init(customerService: CustomerService) {
        
    }
    
}

class CustomerService {
    var receivedMessageCount: Int = 0
}

class CustomerListViewModelTests: XCTestCase {

    func test_init_doesntStartLoadingData() {
        let customerService = CustomerService()
        let _ = CustomerListViewModel(customerService: customerService)
        
        XCTAssertEqual(customerService.receivedMessageCount, 0)
    }

}
