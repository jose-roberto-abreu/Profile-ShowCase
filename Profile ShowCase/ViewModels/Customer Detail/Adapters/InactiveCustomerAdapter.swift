//
//  InactiveCustomerAdapter.swift
//  Profile ShowCase
//
//  Created by Roberto Abreu on 11/2/19.
//  Copyright © 2019 homeappzz. All rights reserved.
//

import Foundation

struct InactiveCustomerAdapter: RowAdapter {
    
    func loadDataSource(completion: (([RowViewModel]) -> Void)) {
        var outputRows: [RowViewModel] = []
        
        outputRows.append(InactiveMessageRowViewModel(title: "Inactive Customer", message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ullamcorper justo placerat risus pulvinar, sed fringilla ligula mattis. Vestibulum mollis orci sed mi vestibulum, in laoreet est pretium."))
        
        completion(outputRows)
    }
    
}
