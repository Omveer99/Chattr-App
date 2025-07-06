//
//  AuthService.swift
//  Chattr
//
//  Created by Omveer Panwar on 15/06/25.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore


class AuthService{
    @Published var userSession: FirebaseAuth.User?
    static let shared = AuthService()
    
    init(){
        self.userSession = Auth.auth().currentUser
        loadCurrentUserData()
    }
    @MainActor
    func login(withEmail email: String, Password: String) async throws{
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: Password)
            self.userSession = result.user
            loadCurrentUserData()
        } catch {
            print("Failed to sign in user User: \(error.localizedDescription)")
        }
    }
    @MainActor
    func createUser(withEmail email: String, Password: String,fullname:String) async throws{
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: Password)
            self.userSession = result.user
            try await self.uploadUserData(email: email, fullname: fullname, id: result.user.uid)
            loadCurrentUserData()
            print("User Created Successfully with UID: \(result.user.uid)")
        } catch{
            print("Failed to create User: \(error.localizedDescription)")
        }
    }
    
    func signOut(){
        do{
            try Auth.auth().signOut()
            self.userSession = nil
            UserService.shared.currentuser = nil
        }catch{
            print("Failed to Signout: \(error.localizedDescription)")
        }
    }
    
    private  func uploadUserData(email: String,fullname: String, id:String) async throws {
        let user = User(fullname: fullname, email: email, profileImageUrl: nil)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else {return}
        try await Firestore.firestore().collection("users").document(id).setData(encodedUser)
    }
    private func loadCurrentUserData()
    {
        Task{try await UserService.shared.fetchCurrewntUser()}
    }
}
