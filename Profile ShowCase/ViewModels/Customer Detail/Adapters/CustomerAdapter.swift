//
//  CustomerAdapter.swift
//  Profile ShowCase
//
//  Created by Roberto Abreu on 11/2/19.
//  Copyright © 2019 homeappzz. All rights reserved.
//

import Foundation

struct CustomerAdapter: RowAdapter {
    
    func loadDataSource(completion: (([RowViewModel]) -> Void)) {
        var outputRows: [RowViewModel] = []
        
        outputRows.append(TitleRowViewModel(title: "Personal Information"))
        outputRows.append(PersonalInformationRowViewModel(title: "Age", value: "38 Years"))
        outputRows.append(PersonalInformationRowViewModel(title: "Address", value: "Paraiso Street, #29 Altos Palo"))
        outputRows.append(PersonalInformationRowViewModel(title: "Degree", value: "Master"))
        
        completion(outputRows)
    }
    
}
