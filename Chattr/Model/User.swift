//
//  Users.swift
//  Chattr
//
//  Created by Omveer Panwar on 08/06/25.
//

import Foundation
import FirebaseFirestore

struct User: Codable, Identifiable,Hashable {
    @DocumentID var uid : String?
    let fullname: String
    let email: String
    let profileImageUrl: String?
    var id : String {
        return uid ?? UUID().uuidString
    }
    
    var firstName: String {
        let formatter = PersonNameComponentsFormatter()
        let components = formatter.personNameComponents(from: fullname)
        return components?.givenName ?? fullname
    }
}



extension User {
    static let MOCK_USER = User(fullname: "Omveer Panwar", email: "omveerpanwar9@gmail.com", profileImageUrl: "Batman")
}
