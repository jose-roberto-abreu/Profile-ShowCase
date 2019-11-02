//
//  FamilyDependentRowViewModel.swift
//  Profile ShowCase
//
//  Created by Roberto Abreu on 11/2/19.
//  Copyright © 2019 homeappzz. All rights reserved.
//

import UIKit

struct FamilyDependentRowViewModel: RowViewModel {
    
    var cellType: UITableViewCell.Type {
        return FamilyDependentTableViewCell.self
    }
    
    var profilePicture: String {
        return familyMember.profilePicture
    }
    
    var name: String {
        return familyMember.name
    }
    
    var relative: String {
        return familyMember.relative
    }
    
    // MARK: - Private Vars
    private let familyMember: FamilyMember
    
    // MARK: - Init
    init(familyMember: FamilyMember) {
        self.familyMember = familyMember
    }
    
}
