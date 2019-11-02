//
//  InactiveMessageRowViewModel.swift
//  Profile ShowCase
//
//  Created by Roberto Abreu on 11/2/19.
//  Copyright © 2019 homeappzz. All rights reserved.
//

import UIKit

struct InactiveMessageRowViewModel: RowViewModel {
    
    var cellType: UITableViewCell.Type {
        return InactiveMessageTableViewCell.self
    }
    
    let title: String
    let message: String
    
}
