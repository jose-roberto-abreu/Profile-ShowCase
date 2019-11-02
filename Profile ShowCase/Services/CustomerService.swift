//
//  CustomerService.swift
//  Profile ShowCase
//
//  Created by Roberto Abreu on 11/2/19.
//  Copyright © 2019 homeappzz. All rights reserved.
//

import Foundation

protocol CustomerService {
    typealias CustomerResult = (Result<[Customer], Error>) -> Void
    func customers(completion: @escaping CustomerResult)
}
