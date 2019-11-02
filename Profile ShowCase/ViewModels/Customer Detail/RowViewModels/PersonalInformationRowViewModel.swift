//
//  PersonalInformationRowViewModel.swift
//  Profile ShowCase
//
//  Created by Roberto Abreu on 11/2/19.
//  Copyright © 2019 homeappzz. All rights reserved.
//

import UIKit

struct PersonalInformationRowViewModel: RowViewModel {
    
    var cellType: UITableViewCell.Type {
        return PersonalInformationTableViewCell.self
    }
    
    let title: String
    let value: String
}
