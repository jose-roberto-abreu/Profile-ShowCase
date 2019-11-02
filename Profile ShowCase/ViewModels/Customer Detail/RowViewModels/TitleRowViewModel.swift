//
//  TitleRowViewModel.swift
//  Profile ShowCase
//
//  Created by Roberto Abreu on 11/2/19.
//  Copyright © 2019 homeappzz. All rights reserved.
//

import UIKit

struct TitleRowViewModel: RowViewModel {
    
    var cellType: UITableViewCell.Type {
        return TitleTableViewCell.self
    }
    
    let title: String
}
