//
//  ProfileHeaderViewModel.swift
//  ramentabetai
//
//  Created by Kazuki Omori on 2022/04/24.
//

import Foundation

struct ProfileHeaderViewModel {
    let user: User
    
    var name: String {
        return user.name
    }
    
    var profileImageUrl: String {
        return user.profileImageUrl
    }
    
    init(user: User) {
        self.user = user
    }
}
