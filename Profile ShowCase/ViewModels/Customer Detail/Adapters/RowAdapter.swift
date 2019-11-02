//
//  RowAdapter.swift
//  Profile ShowCase
//
//  Created by Roberto Abreu on 11/2/19.
//  Copyright © 2019 homeappzz. All rights reserved.
//

import Foundation

protocol RowAdapter {
    
    func loadDataSource(completion: (([RowViewModel]) -> Void))
    
}
