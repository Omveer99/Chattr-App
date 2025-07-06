//
//  UserService.swift
//  Chattr
//
//  Created by Omveer Panwar on 15/06/25.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

class UserService {
    @Published var currentuser: User?
    
    static let shared = UserService()
    
    @MainActor
    func fetchCurrewntUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentuser = user
        
    }
    
  
    static func fetchAllUsers(limit: Int? = nil) async throws -> [User] {
        let query = FirebaseConstants.UserCollection
        if let limit {query.limit(to: limit)}
        let snapshot = try await query.getDocuments()
        return snapshot.documents.compactMap({try? $0.data(as: User.self)})
    }
    
    static func fetchUser(withUid uid: String, completion: @escaping(User) -> Void){
        FirebaseConstants.UserCollection.document(uid).getDocument { snapshot, error in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            completion(user)
        }
    }
    
}
