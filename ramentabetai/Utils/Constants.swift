//
//  Constants.swift
//  ramentabetai
//
//  Created by Kazuki Omori on 2022/04/20.
//

import Firebase

let COLLECTION_USERS = Firestore.firestore().collection("users")
let COLLECTION_FOLLOWERS = Firestore.firestore().collection("followers")
let COLLECTION_FOLLOWING = Firestore.firestore().collection("following")
