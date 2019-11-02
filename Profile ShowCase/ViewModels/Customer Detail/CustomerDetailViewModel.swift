//
//  CustomerDetailViewModel.swift
//  Profile ShowCase
//
//  Created by Roberto Abreu on 11/2/19.
//  Copyright © 2019 homeappzz. All rights reserved.
//

import Foundation

class CustomerDetailViewModel {
    
    // MARK: - Public Vars
    var reload: (() -> Void)?
    
    // MARK: - Private Vars
    private var rowViewModels: [RowViewModel] = []
    
    private let customer: Customer
    private let rowAdapter: RowAdapter
    
    // MARK: - Init
    init(customer: Customer, rowAdapter: RowAdapter) {
        self.customer = customer
        self.rowAdapter = rowAdapter
    }
    
}

// MARK: - Input Methods
extension CustomerDetailViewModel {
    
    func performInitialViewSetup() {
        rowAdapter.loadDataSource { [weak self] (rowViewModels) in
            self?.rowViewModels = rowViewModels
            self?.reload?()
        }
    }
    
}

// MARK: - Support Methods
extension CustomerDetailViewModel {
    
    func numberOfRows() -> Int {
        return rowViewModels.count
    }
    
    func rowViewModel(at index: Int) -> RowViewModel {
        return rowViewModels[index]
    }
    
    func makeCustomerHeaderViewModel() -> CustomerHeaderViewModel {
        return CustomerHeaderViewModel(customer: customer)
    }
    
}
