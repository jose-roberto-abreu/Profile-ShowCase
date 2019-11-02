//
//  FamilyMemberAdapter.swift
//  Profile ShowCase
//
//  Created by Roberto Abreu on 11/2/19.
//  Copyright © 2019 homeappzz. All rights reserved.
//

import Foundation

struct FamilyMemberAdapter: RowAdapter {
    
    func loadDataSource(completion: (([RowViewModel]) -> Void)) {
        var outputRows: [RowViewModel] = []
        
        outputRows.append(TitleRowViewModel(title: "Personal Information"))
        outputRows.append(PersonalInformationRowViewModel(title: "Age", value: "35 Years"))
        outputRows.append(PersonalInformationRowViewModel(title: "Address", value: "New Horizons, #29 Altos Palo"))
        outputRows.append(PersonalInformationRowViewModel(title: "Degree", value: "Doctor"))
        
        outputRows.append(TitleRowViewModel(title: "Family Members"))
        
        let fatherMember = FamilyMember(profilePicture: "father_profile", name: "Rodger Foster", relative: "Father")
        outputRows.append(FamilyDependentRowViewModel(familyMember: fatherMember))
        
        let motherMember = FamilyMember(profilePicture: "mother_profile", name: "Nicole Kingston", relative: "Mother")
        outputRows.append(FamilyDependentRowViewModel(familyMember: motherMember))
        
        completion(outputRows)
    }
    
}
