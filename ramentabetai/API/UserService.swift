//
//  UserService.swift
//  ramentabetai
//
//  Created by Kazuki Omori on 2022/04/20.
//

import Firebase

struct UserService {
    
    static func fetchUser(completion: @escaping (User) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        COLLECTION_USERS.document(uid).getDocument { snapshot, Error in
            
            guard let dictionary = snapshot?.data() else { return }
            
            let user = User(dictionary: dictionary)
            completion(user)
            print("snapshot is \(snapshot?.data())")
        }
    }
}
