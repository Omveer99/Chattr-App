//
//  Constants.swift
//  Chattr
//
//  Created by Omveer Panwar on 27/06/25.
//

import Foundation
import Firebase
import FirebaseAuth

struct FirebaseConstants {
  static  let UserCollection = Firestore.firestore().collection("users")
   static let MessagesCollection = Firestore.firestore().collection("messages")
}
